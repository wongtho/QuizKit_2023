import UIKit

class MathsQuizViewController: UIViewController {

    let questions = [
        "What is 2+2?",
        "What is the square root of 64?",
        "What is 5*3?",
        "What is 9/3?",
        "What is 10-7?"
    ]

    let answers = [
        ["4", "2", "5"],
        ["4", "8", "16"],
        ["15", "10", "3"],
        ["3", "6", "1"],
        ["3", "4", "2"]
    ]
    
    let correctAnswers = [0, 1, 0, 1, 1]
    
    var currentQuestion = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == correctAnswers[currentQuestion] {
            score += 1
        }
        currentQuestion += 1
        if currentQuestion < questions.count {
            updateQuestion()
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    
    func updateQuestion() {
        questionLabel.text = questions[currentQuestion]
        answerButton1.setTitle(answers[currentQuestion][0], for: .normal)
        answerButton2.setTitle(answers[currentQuestion][1], for: .normal)
        answerButton3.setTitle(answers[currentQuestion][2], for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.score = score
            resultVC.totalQuestions = questions.count
        }
    }
}
