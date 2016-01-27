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
    
    var timeTotal = Int64()
    var timeWO = Int()
    var WOtype = String()
    var intIndex = 0
    
    // Shows information about the chosen work out, so it can be palyed: time and exercises.
    func playWO() {
        
        NSUserDefaults.standardUserDefaults().setObject(DB.valueNameWO, forKey: "NameWO")
        DB.selectWOName()
        timeTotal = 0
        
        for (_,v) in DB.WODict {
            //calculates the total time of the work out.
            timeTotal += v
            
            //Dictionaries and indexes: 
            //http://stackoverflow.com/questions/24640990/how-do-i-get-the-key-at-a-specific-index-from-a-dictionary-in-swift
            let index = DB.WODict.startIndex.advancedBy(intIndex)
            timeWO = DB.WODict.values[index]
            WOtype = DB.WODict.keys[index]
        }
    }
}