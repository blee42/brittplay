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
        searchItunesFor("Pink")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var appsTableView: UITableView?
    var tableData = []
    
    func searchItunesFor (searchTerm: String) {
        // iTunes API wants multiple terms separated by + symbols, so replace spaces with +
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        // now escape anything else that is not URL friendly
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                println("Task completed")
                if (error != nil) {
                    // if there is an error in the web request, print to console
                    println(error.localizedDescription)
                }
                var err: NSError?
                
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
                if (err != nil) {
                    // if there is an error parsing JSON, print to console
                    println("JSON Error \(err!.localizedDescription)")
                }
                let results: NSArray = jsonResult["results"] as! NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableData = results
                    self.appsTableView!.reloadData()
                })
            })
            task.resume()
        }
    }

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
