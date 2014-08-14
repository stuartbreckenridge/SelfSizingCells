//
//  XMLParser.swift
//  XMLExample
//
//  Created by Stuart Breckenridge on 12/8/14.
//  Copyright (c) 2014 Stuart Breckenridge. All rights reserved.
//

import Foundation

protocol XMLParserNotifications
{
    func didFinishParsingDocument(songs:[Song])
}

class XMLParser: NSObject, NSXMLParserDelegate {
   
    // Constants
    let xmlURLEndpoint:NSURL = NSURL.URLWithString("http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=30/xml")
    
    //Variables
    var title = String()
    var rights = String()
    var currentElement = String()
    var songArray = [Song]()
    var delegate: XMLParserNotifications?
    
    // MARK: Parse XML
    func parseXML()
    {
        var xmlParser = NSXMLParser(contentsOfURL: xmlURLEndpoint)
        xmlParser.delegate = self
        xmlParser.shouldResolveExternalEntities = false
        xmlParser.parse()
    }
    
    // MARK: NSXMLParserDelegate methods
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: NSDictionary!)
    {
        currentElement = elementName
        
        // Start of entry. Reset title/rights
        if  (elementName == "entry")
        {
            title = ""
            rights = ""
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!)
    {
        // Append characters found from current element
        if  (currentElement == "title")
        {
            title += string
        }
        
        else if (currentElement == "rights")
        {
            rights += string
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!)
    {
        // Finished parsing entry...create Song struct
        if  (elementName == "entry")
        {
            var aSong = Song(songTitle: title, songRights: rights)
            songArray.append(aSong)
        }
        currentElement = ""
    }
    
    func parserDidEndDocument(parser: NSXMLParser!) {
        dispatch_async(dispatch_get_main_queue(), {
           self.delegate?.didFinishParsingDocument(self.songArray)
        ()
        })
    }
}


struct Song{
    var songTitle = String()
    var songRights = String()
}


