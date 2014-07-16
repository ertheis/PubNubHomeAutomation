//
//  DoorViewController.swift
//  PubNubHomeAutomation
//
//  Created by Eric Theis on 7/15/14.
//  Copyright (c) 2014 PubNub. All rights reserved.
//

import UIKit

class HeatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView
    
    var tableData: [String] = ["boop", "doop", "moop"]
    
    override func viewDidLoad() {
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return  self.tableData.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        var toggle = UISwitch()
        toggle.addTarget(self, action: Selector("switchToggled:"), forControlEvents: UIControlEvents.ValueChanged)
        toggle.tintColor = UIColor.redColor()
        toggle.tag = indexPath.row
        
        if toggle.on {
            cell.textLabel.text = "\(self.tableData[indexPath.row]): unlocked"
        } else {
            cell.textLabel.text = "\(self.tableData[indexPath.row]): locked"
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.accessoryView = toggle
        
        return cell
    }
    
    @IBAction func switchToggled(toggle: UISwitch) {
        var cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: toggle.tag, inSection: 0))
        
        if toggle.on {
            cell.textLabel.text = "\(self.tableData[toggle.tag]): unlocked"
        } else {
            cell.textLabel.text = "\(self.tableData[toggle.tag]): locked"
        }
    }
}