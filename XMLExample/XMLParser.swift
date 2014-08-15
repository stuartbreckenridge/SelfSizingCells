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
    func didFinishParsingApps(apps:[App])
}

class XMLParser: NSObject, NSXMLParserDelegate {
   
    // Constants
    let xmlURLEndpoint:NSURL = NSURL.URLWithString("http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=25/xml")
    
    //Variables
    var aName = String()
    var aSummary = String()
    var aPrice = String()
    var aRights = String()
    var currentElement = String()
    var appArray = [App]()
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
            aRights = ""
            aName = ""
            aSummary = ""
            aPrice = ""
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!)
    {
        // Append characters found from current element
        if  (currentElement == "title")
        {
            aName += string
        }
        
        if (currentElement == "summary")
        {
            aSummary += string
        }
            
        if (currentElement == "rights")
        {
            aRights += string
        }
            
        if (currentElement == "im:price")
        {
            aPrice += string
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!)
    {
        // Finished parsing entry...create Song struct
        if  (elementName == "entry")
        {
            var anApp = App(appName: aName, appSummary: aSummary, appPrice: aPrice, appRights: aRights)
            appArray.append(anApp)
        }
        currentElement = ""
    }
    
    func parserDidEndDocument(parser: NSXMLParser!) {
        dispatch_async(dispatch_get_main_queue(), {
            self.delegate?.didFinishParsingApps(self.appArray)
        ()
        })
    }
}




struct App
{
    var appName = String()
    var appSummary = String()
    var appPrice = String()
    var appRights = String()
}


