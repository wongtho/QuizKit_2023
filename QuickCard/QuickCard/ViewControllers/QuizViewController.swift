import UIKit

class QuizViewController: UIViewController {
    
    let questions = [
        "What is the capital of France?",
        "What is the largest planet in our solar system?",
        "What is the highest mountain in the world?",
        "Who invented the telephone?",
        "What is the smallest country in the world?"
    ]
    
    let answers = [
        ["Paris", "Madrid", "London"],
        ["Jupiter", "Saturn", "Neptune"],
        ["Mount Kilimanjaro", "Mount Everest", "Mount McKinley"],
        ["Alexander Graham Bell", "Thomas Edison", "Nikola Tesla"],
        ["Vatican City", "Monaco", "San Marino"]
    ]
    
    let correctAnswers = [0, 0, 1, 0, 0]
    
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
        //add category
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.quizScore[0].initWithCategory(inCategogy: "General")
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
