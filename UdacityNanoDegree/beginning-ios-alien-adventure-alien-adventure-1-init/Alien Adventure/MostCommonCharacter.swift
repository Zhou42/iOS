//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        var countDict = [Character: Int]()
        for item in inventory {
            for char in item.name.lowercaseString.characters {
                if countDict[char] != nil {
                    countDict[char]! += 1
                } else {
                    countDict[char] = 1
                }
                
            }
        }
        var maxNum = -1
        var mostCommonChar: Character? = nil
        for key in countDict.keys {
            if countDict[key] > maxNum {
                maxNum = countDict[key]!
                mostCommonChar = key
            }
        }
        
        
        return mostCommonChar
    }
}
