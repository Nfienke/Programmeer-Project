//
//  WorkOutPlay.swift
//  WOP
//
//  Created by Nienke Pot on 11-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

public class WorkOutPlay { //Moet dit public zijn?
    
    var timeTotal = 6 //database
    var timeWO = 1 //--DB
    var timerTotal = false
    var timerTotalWO = NSTimer()
    var min = 0
    var sec = 0
    
    // timer basics: https://www.youtube.com/watch?v=g_bc4nSGuI4
    
    func WOtimer() {
        sec += 1
        if sec == 60{
            sec = 0
            min += 1
        }
        // Time of total work out has ended.
        if min == timeTotal{
            timerTotalWO.invalidate()
            timerTotal = false
            //segue to WOEndView
        }
    }
    
    func onOffTimer() {
        if timerTotal == true{
            //timerTotalWO = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:Selector("WOtimer"), userInfo: nil, repeats: true)
         
        }
        if timerTotal == false {
            self.timerTotalWO.invalidate()
        }
    }

}