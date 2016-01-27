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
    
    var wotypes = [String]()
    @IBOutlet weak var tableWoOverview: UITableView!
        
    @IBAction func backToWOViewButton(sender: UIButton) {
        DB.WOOverview = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wotypes = []
        
        if DB.WOOverview == []{
            DB.selectWOName()
        }
        
        wotypes = DB.WOOverview
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B6.png")!)
        self.tableWoOverview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
         tableWoOverview.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Table an overview of the exercises and time from the chosen work out.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  wotypes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableWoOverview.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = wotypes[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //nog iets erin zetten? en een remove?
    }
}