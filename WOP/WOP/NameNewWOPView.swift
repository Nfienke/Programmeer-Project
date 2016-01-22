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
    
    @IBAction func NextNewWoButton(sender: AnyObject) {
        
    }
    
    // test if a name is entered and if a name is unique
    //http://jamesleist.com/ios-swift-tutorial-stop-segue-show-alert-text-box-empty/
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "nameToNewWO" {
                
            if nameNewField.text != "" {
                DB.valueNameWO = nameNewField.text!
                DB.insertNewWO()
                
                if DB.uniqueNameCheck == true{
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

//
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let destinationVC = segue.destinationViewController as? NewWOPView{
//
//            destinationVC.NameWO = nameNewField.text!
//
//        }
//    }
