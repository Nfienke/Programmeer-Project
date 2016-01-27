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
    
    var WOoverview = [String]()
    @IBOutlet weak var OverviewTable: UITableView!
    
    @IBAction func GoToWoView(sender: UIButton) {
        
        if DB.WOOverview == [] {
            DB.selectWOName()
            DB.valueNameWO = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Clears some values.
        DB.valueNameWO = ""
        DB.WOview = []
        
        //Selects in DBModel all the work out possibilities.
        DB.selectViewWO()
        WOoverview = DB.WOview
    
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
        DB.valueNameWO = WOoverview[indexPath.row]
    }
    
    // Removes an work out from the table and in DBModel from the Database.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            DB.valueNameWO = WOoverview[indexPath.row]
            WOoverview.removeAtIndex(indexPath.row)
            DB.removeWO()
            OverviewTable.reloadData()
        }
    }
}