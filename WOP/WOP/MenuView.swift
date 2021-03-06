//
//  ViewController.swift
//  WOP
//
//  Created by Nienke Pot on 05-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import UIKit
import Foundation

class MenuView: UIViewController {
    
    @IBOutlet weak var playButtton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Background: http://stackoverflow.com/questions/25106784/how-to-set-a-background-image-to-a-uiview-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B9.png")!)
        
        //NSUserdefaults loading: checking if there was a previous work out.
        if NSUserDefaults.standardUserDefaults().objectForKey("WO") != nil {
            DBModel.sharedInstance.ExerciseDict = NSUserDefaults.standardUserDefaults().objectForKey("WO") as! Dictionary!
            
            playButtton.hidden = false
        }
            
        else {
            playButtton.hidden = true
        }
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

