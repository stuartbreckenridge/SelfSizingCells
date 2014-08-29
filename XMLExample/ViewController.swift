//
//  ViewController.swift
//  XMLExample
//
//  Created by Stuart Breckenridge on 12/8/14.
//  Copyright (c) 2014 Stuart Breckenridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var theApps = [App]()
    @IBOutlet weak var appTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add notification observer for content size changes.
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "didChangeSize:",
            name: UIContentSizeCategoryDidChangeNotification,
            object: nil)
        
        // Configure Table View.
        self.appTableView.dataSource = self
        self.appTableView.delegate = self
        self.appTableView.estimatedRowHeight = 110.0
        self.appTableView.rowHeight = UITableViewAutomaticDimension
        
        // Launch parser in background queue.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            var aParser = XMLParser()
            aParser.delegate = self
            aParser.parseXML()
        })
    }
    
    @objc private func didChangeSize(notification:NSNotification)
    {
        self.appTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}