//
//  WorkOutPlay.swift
//  WOP
//
//  Created by Nienke Pot on 11-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

public class WOPlay {
    
    var timeTotal = Int64()
    var timeWO = Int()
    var WOtype = String()
    var intIndex = 0
    
    // Processses information about the chosen work out, so it can be played: time and exercises.
    func playWO() {
        
        NSUserDefaults.standardUserDefaults().setObject(DBModel.sharedInstance.valueNameWO, forKey: "NameWO")
        print("hier8",DBModel.sharedInstance.valueNameWO)
        
        DBModel.sharedInstance.selectWOName()
        timeTotal = 0
        
        for (_,v) in DBModel.sharedInstance.ExerciseDict {
            //calculates the total time of the work out.
            timeTotal += v
            
            //Dictionaries and indexes: 
            //http://stackoverflow.com/questions/24640990/how-do-i-get-the-key-at-a-specific-index-from-a-dictionary-in-swift
            let index = DBModel.sharedInstance.ExerciseDict.startIndex.advancedBy(intIndex)
            timeWO = DBModel.sharedInstance.ExerciseDict.values[index]
            WOtype = DBModel.sharedInstance.ExerciseDict.keys[index]
        }
    }
}