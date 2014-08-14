//
//  ViewController.swift
//  XMLExample
//
//  Created by Stuart Breckenridge on 12/8/14.
//  Copyright (c) 2014 Stuart Breckenridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserNotifications, UITableViewDataSource, UITableViewDelegate {
    
    var theSongs = [Song]()
    @IBOutlet weak var songTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        songTableView.dataSource = self
        songTableView.delegate = self
        songTableView.estimatedRowHeight = 70.0
        songTableView.rowHeight = UITableViewAutomaticDimension
        
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

// XMLParserNotifications
extension ViewController
{
    func didFinishParsingDocument(songs:[Song])
    {
        theSongs = songs
        songTableView.reloadData()
    }
}

// UITableViewDataSource
extension ViewController
{
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return theSongs.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cellIdentifier = "Cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as SongCell
        
        var song = theSongs[indexPath.row] as Song
        
        cell.songLabel.text = song.songTitle
        cell.rightsLabel.text = song.songRights
       
        return cell
    }
}




