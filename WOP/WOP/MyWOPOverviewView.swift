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
    
    @IBAction func startWOButton(sender: UIButton) {
//        NSUserDefaults.standardUserDefaults().setObject(DB.WODict, forKey: "WODict")
        //print(DB.WODict)
    }
    
    @IBAction func backToWOViewButton(sender: UIButton) {
        DB.WOOverview = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wotypes = []
        if DB.WOOverview == []{
            DB.selectWOName()
            print("jajaja")
        }
        wotypes = DB.WOOverview
        print("workout", DB.WOOverview)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B6.png")!)
        self.tableWoOverview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  wotypes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableWoOverview.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = wotypes[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #\(indexPath.row)!")
        
    }
    

    

}