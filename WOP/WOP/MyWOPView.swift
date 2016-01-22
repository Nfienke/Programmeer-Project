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
    
    @IBAction func GoToWoView(sender: UIButton) {
        if DB.WOOverview == [] {
             DB.selectWOName()
        }
       
    }
    
    @IBOutlet weak var OverviewTable: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        DB.WOview = []
        DB.selectViewWO()
        
        WOoverview = DB.WOview
        print (WOoverview)
        
        //DB.selectViewWO()
        self.OverviewTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B10.png")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //table
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  WOoverview.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.OverviewTable.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = WOoverview[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #(indexPath.row)!")
        DB.valueNameWO = WOoverview[indexPath.row]
        //print(DB.valueNameWO)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            DB.valueNameWO = WOoverview[indexPath.row]
            WOoverview.removeAtIndex(indexPath.row)
            DB.removeWO()
            OverviewTable.reloadData()
        }

    }
   
    
   
    

}