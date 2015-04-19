//
//  ViewController.swift
//  HelloWorld
//
//  Created by Brittany Lee on 4/14/15.
//  Copyright (c) 2015 Brittany Lee. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol {
    let api = APIController()

    override func viewDidLoad() {
        super.viewDidLoad()
        api.delegate = self
        api.searchItunesFor("Pink")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveAPIResults(results: NSArray) {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = results
            self.appsTableView!.reloadData()
        })
    }
    
    @IBOutlet var appsTableView: UITableView?
    var tableData = []

    func tableView (tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        let rowData: NSDictionary = self.tableData[indexPath.row] as! NSDictionary
        
        cell.textLabel?.text = rowData["trackName"] as? String
        
        // grab artwork for image URL thumbnail
        let urlString: NSString = rowData["artworkUrl60"] as! NSString
        let imgURL: NSURL? = NSURL(string: urlString as String)
        
        // download as NSData representation of the image
        let imgData = NSData(contentsOfURL: imgURL!)
        cell.imageView?.image = UIImage(data: imgData!)
        
        // get formated price string for display
        let formattedPrice: NSString = rowData["formattedPrice"] as! NSString
        
        cell.detailTextLabel?.text = formattedPrice as String
        return cell
    }

}

