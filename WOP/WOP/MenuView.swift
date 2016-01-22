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
        
         DB.selectWO() //mag eruit
        
        //Background: http://stackoverflow.com/questions/25106784/how-to-set-a-background-image-to-a-uiview-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B9.png")!)
        
        //NSUserdefaults laden
        if NSUserDefaults.standardUserDefaults().objectForKey("NameWO") != nil{
            DB.valueNameWO = NSUserDefaults.standardUserDefaults().objectForKey("NameWO") as! String
            
            playButtton.hidden = false
        }
        else{
        
            playButtton.hidden = true
        }

   }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

