//
//  ScienceQuizViewController.swift
//  QuickCard
//
//  Created by PRANAV on 19/04/2023.
//

import UIKit

class ScienceQuizViewController: UIViewController {

    let questions = [
         "What is the largest organ in the human body?",
         "What is the smallest unit of life?",
         "What is the Earth's primary source of energy?",
         "What does DNA stand for?",
         "What type of animal is a narwhal?"
     ]

     let answers = [
         ["Skin", "Brain", "Liver"],
         ["Cell", "Atom", "Molecule"],
         ["Sun", "Moon", "Fossil fuels"],
         ["Deoxyribonucleic Acid", "Digital Network Architecture", "Dynamic Network Administration"],
         ["Whale", "Seal", "Fish"]
     ]
     
     let correctAnswers = [0, 0, 2, 0, 2]
     
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
        mainDelegate.quizScore[0].initWithCategory(inCategogy: "Science")
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
