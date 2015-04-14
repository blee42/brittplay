//
//  ViewController.swift
//  HelloWorld
//
//  Created by Brittany Lee on 4/14/15.
//  Copyright (c) 2015 Brittany Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView (tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // hard-coded to 10, but could be the length of an array controller
        return 10
    }
    
    func tableView (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        cell.textLabel?.text = "Row #\(indexPath.row)"
        cell.detailTextLabel?.text = "Subtitle #\(indexPath.row)"
        
        return cell
    }

}

