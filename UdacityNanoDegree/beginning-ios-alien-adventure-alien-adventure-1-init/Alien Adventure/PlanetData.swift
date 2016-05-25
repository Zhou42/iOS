//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "json")!
        let planetArrayRaw = NSData(contentsOfURL: dataFileURL)!
        var maxValue = -1
        var value = 0
        var name: String = ""
        
        var planetArray: [[String: AnyObject]]
        do{
            planetArray = try! NSJSONSerialization.JSONObjectWithData(planetArrayRaw, options: NSJSONReadingOptions()) as! [[String: AnyObject]]
        }
        
        for planet in planetArray {
            value = (planet["CommonItemsDetected"] as! Int) + (planet["UncommonItemsDetected"]as! Int)  * 2 + (planet["RareItemsDetected"]as! Int)  * 3 + (planet["LegendaryItemsDetected"]as! Int)  * 4
            if value > maxValue {
                maxValue = value
                name = planet["Name"] as! String
            }
        }
        
        return name
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"