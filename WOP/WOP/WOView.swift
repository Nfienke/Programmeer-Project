//
//  WOView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class WOView: UIViewController {
    
    var WO = WorkOutPlay() //model
    
    @IBOutlet weak var labelTotalRunTime: UILabel!
    @IBOutlet weak var LabelTotalOverviewTime: UILabel!
    
    @IBAction func breakButton(sender: UIButton) {
        if WO.timerTotal == true{
            WO.timerTotal = false
        }
    }
    
    @IBAction func stopButton(sender: UIButton) {
        if WO.timerTotal == true{
            WO.timerTotal = false
        }
    }
    
    @IBAction func playButton(sender: UIButton) {
        if WO.timerTotal == false{
            WO.timerTotal = true
            WO.onOffTimer()
        }
        
        labelTotalRunTime.text! = "\(String(format:"%02d", WO.min)):\(String(format:"%02d", WO.sec))"     // format: http://rshankar.com/simple-stopwatch-app-in-swift/
    }
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B4.png")!)
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}