//
//  ScoreData.swift
//  QuickCard
//
//  Created by  on 2023-04-19.
//

import UIKit
//data object for score
class ScoreData: NSObject {
    var id: Int?
    var category: String?
    var score: Int?
    //initialize from databbase
    func initWithDatabase(theRow i: Int, theCategory c: String, theScore s: Int) {
        id = i
        category = c
        score = s
    }
    //initialize on selecting quiz category
    func initWithCategory(inCategogy: String) {
        category = inCategogy
    }
    //initialize on result screen with score
    func initWithScore(inScore: Int) {
        score = inScore
    }
}
