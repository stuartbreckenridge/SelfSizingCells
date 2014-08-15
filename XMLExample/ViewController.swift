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
        // Do any additional setup after loading the view, typically from a nib.      
        
        self.appTableView.dataSource = self
        self.appTableView.delegate = self
        self.appTableView.estimatedRowHeight = 110.0
        self.appTableView.rowHeight = UITableViewAutomaticDimension
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            var aParser = XMLParser()
            aParser.delegate = self
            aParser.parseXML()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: XMLParserNotifications
{
    func didFinishParsingApps(apps:[App])
    {
        self.theApps = apps
        self.appTableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.theApps.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cellIdentifier = "Cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as AppCell
        
        var app = theApps[indexPath.row] as App
        
        cell.appName.text = app.appName
        cell.appPrice.text = app.appPrice
        cell.appRights.text = app.appRights
        cell.appSummary.text = app.appSummary
       
        return cell
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}




