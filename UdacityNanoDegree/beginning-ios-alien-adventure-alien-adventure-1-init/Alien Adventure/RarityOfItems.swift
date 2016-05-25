//
//  RarityOfItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func rarityOfItems(inventory: [UDItem]) -> [UDItemRarity:Int] {
        var rarityDict: [UDItemRarity:Int] = [ .Common: 0, .Uncommon: 0, .Rare: 0, .Legendary: 0 ];
        for item in inventory {
            if let count = rarityDict[item.rarity] {
                rarityDict[item.rarity] = count + 1
            } else {
                rarityDict[item.rarity] = 1
            }
        }
        return rarityDict
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"