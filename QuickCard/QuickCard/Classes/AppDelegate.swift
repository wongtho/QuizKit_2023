//
//  AppDelegate.swift
//  QuickCard
//
//  Created by  on 2023-03-30.
//
import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //initialize AppDelegate variables
    var databaseName: String = "QuickCard.db"
    var databasePath: String = ""
    var quizScore: [ScoreData] = []


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //get document path in phone
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDir = documentPaths[0]
        //append name to path
        databasePath = documentsDir.appending("/" + databaseName)
        //check if file exist
        checkAndCreateDatabase()
        //call database
        readDataFromDatabase()
        return true
    }
    //read data
    func readDataFromDatabase() {
        quizScore.removeAll()
        var db: OpaquePointer? = nil
        
        if sqlite3_open(databasePath, &db) == SQLITE_OK {
            print("successfully opened connection at \(databasePath)")
            
            var queryStatement: OpaquePointer? = nil
            let queryStatementString: String = "select * from entries"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                print("Prepare successful")
                while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                    
                    let id: Int = Int(sqlite3_column_int(queryStatement, 0))
                    let ccategory = sqlite3_column_text(queryStatement, 1)
                    let cscore = sqlite3_column_int(queryStatement, 2)
                    
                    //cast to text from varChar
                    let category = String(cString: ccategory!)
                    let score = Int(cscore)
                    //store data in object
                    let data: ScoreData = .init()
                    data.initWithDatabase(theRow: id, theCategory: category, theScore: score)
                    quizScore.append(data)
                }
                sqlite3_finalize(queryStatement)
            } else {
                print("Could not prepare query statement")
            }
            //close connection
            sqlite3_close(db)
        } else {
            print("Unable to open database")
        }
    }
    
    func checkAndCreateDatabase() {
        var success = false
        let fileManager = FileManager.default
        success = fileManager.fileExists(atPath: databasePath)
        if success {
            return
        }
        //else copy file to device
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName)
        
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath)
        return
        
    }

    //insert data to database
    func insertIntoDatabase(scoreInfo: ScoreData) -> Bool {
        var db: OpaquePointer? = nil
        var returnCode: Bool = true
        
        if sqlite3_open(databasePath, &db) == SQLITE_OK {
            var insertStatement: OpaquePointer? = nil
            let insertStatementString: String = "insert into entries values(NULL, ?, ?)"
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                //convert *char
                let categoryStr = scoreInfo.category as! NSString
                let scoreInt = Int32(scoreInfo.score ?? 0)
                
                sqlite3_bind_text(insertStatement, 1, categoryStr.utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 2, scoreInt)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row \(rowID)")
                } else {
                    print("Could not insert row")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            } else {
                print("Could not prepare database")
                returnCode = false
            }
            sqlite3_close(db)
        } else {
            print("Unable to open database")
        }
        return returnCode
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}