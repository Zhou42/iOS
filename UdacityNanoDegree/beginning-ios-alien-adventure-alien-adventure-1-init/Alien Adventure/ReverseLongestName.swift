//
//  ReverseLongestName.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func reverseLongestName(inventory: [UDItem]) -> String {
        var longestString: String = ""
        var maxLength: Int = -1
        for item in inventory {
            let length: Int = item.name.characters.count
            if maxLength < length {
                maxLength = length;
                longestString = item.name
            }
        }
        let reverseLongest: String = String(longestString.characters.reverse())
        return reverseLongest
    }
    
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 1"