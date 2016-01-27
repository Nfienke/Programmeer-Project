//
//  NewWOPView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class NewWOPView: UIViewController {
    
    // Exercises
    var WOTypes = ["Cruch","Run","Jump","Push up","Lift"]
    //Total time of the new exercise.
    @IBOutlet weak var labelTotalTime: UILabel!
    var time = Int64()
    
    //Shows the new work out in MYWOPOVerviewView.
    @IBAction func GoToWOButton(sender: UIButton) {
      DB.selectWOName()
    }
    
    //To chose the length of an exercise.
    //http://www.ioscreator.com/tutorials/segmented-control-tutorial-ios8-swift
    @IBOutlet weak var minutesBar: UISegmentedControl!
    @IBAction func minutesChanger(sender: UISegmentedControl) {
        switch minutesBar.selectedSegmentIndex{
        case 0:
            DB.valueMin = 2;
        case 1:
            DB.valueMin = 5;
        case 2:
            DB.valueMin = 10;
        case 3:
            DB.valueMin = 15;
        case 4:
            DB.valueMin = 20;
        case 5:
            DB.valueMin = 30;
        default:
            break;
        }
    }
    
    //Adds an exercise to the work out.
    @IBAction func addButton(sender: UIButton) {
        DB.insertNewExercises()
        time += DB.valueMin
        labelTotalTime.text! = "Total Time:\(time):00 minutes"
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //Start values of the minutesbar and pickerview.
         DB.valueMin = 2
         DB.valueWOType = "Crunch"
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B1.png")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Pickerview of the exercises: http://www.ioscreator.com/tutorials/picker-view-tutorial-ios8-swift
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WOTypes.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return WOTypes[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int){
        DB.valueWOType = WOTypes[row]
        self.view.endEditing(true)
    }
}