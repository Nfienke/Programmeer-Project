//
//  WorkOutPlay.swift
//  WOP
//
//  Created by Nienke Pot on 11-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit
var WO = WorkOutPlay()

public class WorkOutPlay {
    
    var timeTotal: Int64 = Int64() // from database total time
    var timeWO = Int() // time of wotype
    var WOtype = String()
    var intIndex = 0
    
    func playWO() {
        timeTotal = 0
         
        //NSUserDefaults.standardUserDefaults().setObject(DB.WODict, forKey: "key")
        for (_,v) in DB.WODict {
            timeTotal += v
            
            //http://stackoverflow.com/questions/24640990/how-do-i-get-the-key-at-a-specific-index-from-a-dictionary-in-swift
            let index = DB.WODict.startIndex.advancedBy(intIndex)
            print("index en verder")// if index is out of range
            timeWO = DB.WODict.values[index]
            WOtype = DB.WODict.keys[index]
            
        }
        print("wo is: ", DB.WODict)
    }
}