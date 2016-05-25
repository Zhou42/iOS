//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        print(dataFile)
        var bannedItemID: [Int] = [Int]()
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "plist")!
        let itemArray = NSArray(contentsOfURL: dataFileURL) as! [[String: AnyObject]]
        // print(itemArray)
        for item in itemArray {
            print(item["Name"])
            print(item["HistoricalData"]!["CarbonAge"])
            print("\n")
            
            if let age = item["HistoricalData"]!["CarbonAge"] as? Int {
                if item["Name"]!.containsString("Laser") && (age < 30) {
                    bannedItemID.append(item["ItemID"] as! Int)
                }
            }
            
        }
        return bannedItemID
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"