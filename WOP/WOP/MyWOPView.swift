//
//  MyWOPView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class MyWOPView: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var GoToWoButton: UIButton!
    var WOoverview = [String]()
    @IBOutlet weak var OverviewTable: UITableView!
    
    @IBAction func GoToWoView(sender: UIButton) {
        
        if DBModel.sharedInstance.ExerciseOverview == [] {
            DBModel.sharedInstance.selectWOName()
            DBModel.sharedInstance.valueNameWO = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Clears some values.
        DBModel.sharedInstance.valueNameWO = ""
        DBModel.sharedInstance.WOview = []
        
        //Selects in DBModel all the work out possibilities.
        DBModel.sharedInstance.selectViewWO()
        WOoverview = DBModel.sharedInstance.WOview
        
        //Only shows button when an work out is selected.
        GoToWoButton.hidden = true
        
        //Lay-out.
        self.OverviewTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B10.png")!)
        OverviewTable.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Table of all the work outs.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  WOoverview.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.OverviewTable.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = WOoverview[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        DBModel.sharedInstance.valueNameWO = WOoverview[indexPath.row]
        GoToWoButton.hidden = false
    }
    
    // Removes a work out from the table and in DBModel from the Database.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            DBModel.sharedInstance.valueNameWO = WOoverview[indexPath.row]
            WOoverview.removeAtIndex(indexPath.row)
            DBModel.sharedInstance.removeWO()
            OverviewTable.reloadData()
        }
    }
}