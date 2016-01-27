//
//  NameNewWOPView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class NameNewWOPView: UIViewController {

    @IBOutlet weak var nameNewField: UITextField!
 
    //Test if a name is entered and is unique.
    //http://jamesleist.com/ios-swift-tutorial-stop-segue-show-alert-text-box-empty/
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "nameToNewWO" {
                
            if nameNewField.text != "" {
                DBModel.sharedInstance.valueNameWO = nameNewField.text!
                DBModel.sharedInstance.insertNewWO()
                
                if DBModel.sharedInstance.uniqueNameCheck == true{
                    return true
                }
                    
                else{
                    nameNewField.backgroundColor = UIColor.redColor()
                    return false
                }
            }
        }
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B7.png")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

