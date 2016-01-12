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
    var timerTotalWO = NSTimer()
    var min = 0
    var sec = 0
    
    @IBOutlet weak var labelTotalRunTime: UILabel!
    @IBOutlet weak var LabelTotalOverviewTime: UILabel!
    
    // timer basics: https://www.youtube.com/watch?v=g_bc4nSGuI4
    func WOtimer() {
        sec += 1
        if sec == 60{
            sec = 0
            min += 1
        }
        
        labelTotalRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"     // format: http://rshankar.com/simple-stopwatch-app-in-swift/
      
       // Time of total work out has ended.
        if min == WO.timeTotal{
            timerTotalWO.invalidate()
            WO.timerTotal = false
            //segue to WOEndView
        }
    }

    @IBAction func breakButton(sender: UIButton) {
        
        timerTotalWO.invalidate()
        WO.timerTotal = false
    }
    
    @IBAction func stopButton(sender: UIButton) {
        
        if WO.timerTotal == true{
            timerTotalWO.invalidate()
            WO.timerTotal = false
        }
    }
    
    @IBAction func playButton(sender: UIButton) {
        
        if WO.timerTotal == false{
            timerTotalWO = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("WOtimer"), userInfo: nil, repeats: true)
            WO.timerTotal = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B4.png")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}