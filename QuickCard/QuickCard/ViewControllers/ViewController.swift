//
//  ViewController.swift
//  QuickCard
//
//  Created by  on 2023-03-30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var StartButton : UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StartButton.layer.cornerRadius = 26
        StartButton.layer.masksToBounds = true

    }

}
