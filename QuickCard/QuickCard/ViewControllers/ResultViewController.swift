//
//  ResultViewController.swift
//  QuickCard
//
//  Created by PRANAV on 18/04/2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var StartButton : UIButton!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        StartButton.layer.cornerRadius = 26
        StartButton.layer.masksToBounds = true
        resultLabel.text = "\(result)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
