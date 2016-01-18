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
    
    @IBOutlet weak var tableWoOverview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("workout", DB.valueIdWO, DB.valueNameWO, DB.valueWOType, DB.valueMin)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B6.png")!)
        self.tableWoOverview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  DB.WOOverview.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableWoOverview.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = DB.WOOverview[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }

}