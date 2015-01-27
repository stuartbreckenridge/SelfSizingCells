//
//  ViewControllerExtensions.swift
//  XMLExample
//
//  Created by Stuart Breckenridge on 15/8/14.
//  Copyright (c) 2014 Stuart Breckenridge. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.theApps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellIdentifier = "Cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as AppCell
        
        var app = theApps[indexPath.row] as App
        cell.populateCell(appData:app)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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