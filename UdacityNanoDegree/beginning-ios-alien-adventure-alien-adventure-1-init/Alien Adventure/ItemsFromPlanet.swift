//
//  ItemsFromPlanet.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func itemsFromPlanet(inventory: [UDItem], planet: String) -> [UDItem] {
        var returnedItems:[UDItem] = [UDItem]();
        // print(planet)
        for item in inventory {
            if let myItem = item.historicalData["PlanetOfOrigin"] as? String {
                if myItem == planet {
                    returnedItems.append(item)
                }
            }
        }
        return returnedItems;
    }
    
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 1"