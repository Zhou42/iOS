//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        if s1.characters.count == 0 && s2.characters.count == 0 && shuffle.characters.count == 0 {
            return true
        } else if (s1.characters.count + s2.characters.count != shuffle.characters.count) {
            return false
        } else {
            var p1: Int = 0;
            var p2: Int = 0;
            for i in 1...shuffle.characters.count {
                if (s1.characters.count > p1) && (Array(shuffle.characters)[p1 + p2] == Array(s1.characters)[p1]) {
                    p1 += 1
                } else if (s2.characters.count > p2) && (Array(shuffle.characters)[p1 + p2] == Array(s2.characters)[p2]) {
                    p2 += 1
                } else {
                    return false
                }
            }
            return true
        }
    }
}
