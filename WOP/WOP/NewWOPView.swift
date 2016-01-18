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
    
    @IBOutlet weak var minutesBar: UISegmentedControl!
    
    //http://www.ioscreator.com/tutorials/segmented-control-tutorial-ios8-swift
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
    
    
    @IBAction func addButton(sender: UIButton) {
        DB.insertNewExercises()
        //print(DB.valueMin)
    }
  
   
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //insertNewExercises()
        print("2e scherm",DB.valueIdWO)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B1.png")!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Pickerview
    //http://www.ioscreator.com/tutorials/picker-view-tutorial-ios8-swift
    var WOTypes = ["Cruch","Run","Jump","Push up"]
    
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
        //print(WOTypes[row])
        DB.valueWOType = WOTypes[row]
        self.view.endEditing(true)
    }
}