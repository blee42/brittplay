//
//  APIController.swift
//  HelloWorld
//
//  Created by Brittany Lee on 4/19/15.
//  Copyright (c) 2015 Brittany Lee. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results : NSArray)
}

class APIController {
    var delegate: APIControllerProtocol?
    
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
                if let results: NSArray = jsonResult["results"] as? NSArray {
                    self.delegate?.didReceiveAPIResults(results)
                }
            })
            task.resume()
        }
    }
}