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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DB.selectWO()
        
        //http://stackoverflow.com/questions/25106784/how-to-set-a-background-image-to-a-uiview-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B9.png")!)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

