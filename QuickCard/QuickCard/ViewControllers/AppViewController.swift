//
//  AppViewController.swift
//  QuickCard
//
//  Created by PRANAV on 19/04/2023.
//

import UIKit

class AppViewController: UIViewController {

    @IBOutlet var Background1 : UIImageView!
    @IBOutlet var Background2 : UIImageView!
    @IBOutlet var Background3 : UIImageView!
    
    @IBOutlet var ICON1 : UIImageView!
    @IBOutlet var ICON2 : UIImageView!
    @IBOutlet var ICON3 : UIImageView!
    @IBAction func unwindToAppViewController(sender : UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Background1.layer.cornerRadius = 26
        Background1.layer.masksToBounds = true
        
        Background2.layer.cornerRadius = 26
        Background2.layer.masksToBounds = true
        
        Background3.layer.cornerRadius = 26
        Background3.layer.masksToBounds = true
        
        ICON1.layer.cornerRadius = 45
        ICON1.layer.masksToBounds = true
        
        ICON2.layer.cornerRadius = 45
        ICON2.layer.masksToBounds = true
        
        ICON3.layer.cornerRadius = 45
        ICON3.layer.masksToBounds = true
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
