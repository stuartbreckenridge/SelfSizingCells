//
//  ViewController.swift
//  XMLExample
//
//  Created by Stuart Breckenridge on 12/8/14.
//  Copyright (c) 2014 Stuart Breckenridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var theSongs = [Song]()
    @IBOutlet weak var songTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.      
        
        self.songTableView.dataSource = self
        self.songTableView.delegate = self
        self.songTableView.estimatedRowHeight = 70.0
        self.songTableView.rowHeight = UITableViewAutomaticDimension
        
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
    func didFinishParsingDocument(songs:[Song])
    {
        theSongs = songs
        self.songTableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.theSongs.count
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

extension ViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}




