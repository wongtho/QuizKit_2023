import UIKit

class ScoreData: NSObject {
    var id: Int?
    var category: String?
    var score: Int?

    func initWithDatabase(theRow i: Int, theCategory c: String, theScore s: Int) {
        id = i
        category = c
        score = s
    }
    func initWithCategory(inCategogy: String) {
        category = inCategogy
    }
    func initWithScore(inScore: Int) {
        score = inScore
    }
}