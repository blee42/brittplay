//
//  ViewController.swift
//  HelloWorld
//
//  Created by Brittany Lee on 4/14/15.
//  Copyright (c) 2015 Brittany Lee. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol {
    var tableData = []
    let api = APIController()
    let kCellIdentifier: String = "SearchResultCell"
    @IBOutlet var appsTableView: UITableView?

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

    func tableView (tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as! UITableViewCell
        
        if let rowData: NSDictionary = self.tableData[indexPath.row] as? NSDictionary,
            // grab artwork for image URL thumbnail
            urlString: NSString = rowData["artworkUrl60"] as? NSString,
            imgURL: NSURL? = NSURL(string: urlString as String),
            // download as NSData representation of the image
            imgData = NSData(contentsOfURL: imgURL!),
            // get formated price string for display
            formattedPrice: NSString = rowData["formattedPrice"] as? NSString,
            trackName = rowData["trackName"] as? String {
                // get formatted price string for display in the subtitle
                cell.detailTextLabel?.text = formattedPrice as String
                // update imageView cell to use the downloaded image data
                cell.imageView?.image = UIImage(data: imgData)
                // update the textLabel text to use the trackname from API
                cell.textLabel?.text = trackName
            }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // get row data for the selected row
        if let rowData = self.tableData[indexPath.row] as? NSDictionary,
            // get name of the track for this row
            name = rowData["trackName"] as? String,
            // get price of the track on this row
            formattedPrice = rowData["formattedPrice"] as? String {
                let alert = UIAlertController(title: name, message: formattedPrice, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
    }

}

