//
//  ScoreTableController.swift
//  QuickCard
//
//  Created by  on 2023-04-19.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.quizScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell: EasyTableCell = tableView.dequeueReusableCell(withIdentifier: "easycell") as? EasyTableCell ?? EasyTableCell(style: .default, reuseIdentifier: "easycell")
        
        tableCell.categoryLabel.text = mainDelegate.quizScore[indexPath.row].category
        tableCell.scoreLabel?.text = "\(mainDelegate.quizScore[indexPath.row].score)"
        return tableCell
    }
    //set row heigh
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    //onload
    override func viewDidLoad() {
        super.viewDidLoad()
        //refresh appdelegate data from database
        mainDelegate.readDataFromDatabase()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
