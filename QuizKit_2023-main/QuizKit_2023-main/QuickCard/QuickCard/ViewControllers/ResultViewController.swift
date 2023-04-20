import UIKit

class ResultViewController: UIViewController {

    var score: Int = 0
    var totalQuestions: Int = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var ReturnButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReturnButton.layer.cornerRadius = 26
        ReturnButton.layer.masksToBounds = true
        
        scoreLabel.text = "\(score)/\(totalQuestions)"
        //add score
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.quizScore[0].initWithScore(inScore: score)
        //save to db
        mainDelegate.insertIntoDatabase(scoreInfo: mainDelegate.quizScore[0])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        score = 0
        totalQuestions = 0
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    //go back to result without reinitialization from leaderboard screen
    @IBAction func unwindToResultViewController(sender : UIStoryboardSegue) {
        
    }
}

