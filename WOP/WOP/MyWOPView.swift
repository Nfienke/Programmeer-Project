//
//  MyWOPView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class MyWOPView: UIViewController {
    
    var WOoverview = [String]()
    
    @IBAction func GoToWoView(sender: UIButton) {
        
        DB.selectWOName()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DB.WOview == []{ //date ie wel up bij nieuwe insert?
            DB.selectViewWO()
        }
        WOoverview = DB.WOview
        //DB.selectViewWO()
        
        
        
    
        
     
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B10.png")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //pickerview
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WOoverview.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return WOoverview[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int){
        //print(WOoverview[row])
        DB.valueNameWO = WOoverview[row]
        
        self.view.endEditing(true)
    }
    

}