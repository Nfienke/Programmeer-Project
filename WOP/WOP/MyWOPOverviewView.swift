//
//  MyWOPOverviewView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class MyWOPOverviewView: UIViewController, UITableViewDelegate, UITableViewDataSource  {
 
    var woTypes = [String]()
    @IBOutlet weak var tableWoOverview: UITableView!
        
    @IBAction func backToWOViewButton(sender: UIButton) {
        DBModel.sharedInstance.ExerciseOverview = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        woTypes = []
        
        if DBModel.sharedInstance.ExerciseOverview == [] {
            DBModel.sharedInstance.selectWOName()
        }
        
        woTypes = DBModel.sharedInstance.ExerciseOverview
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B6.png")!)
        self.tableWoOverview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
         tableWoOverview.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Table an overview of the exercises and time from the chosen work out.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  woTypes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableWoOverview.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = woTypes[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}