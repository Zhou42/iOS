//
//  InscriptionEternalStar.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func inscriptionEternalStar(inventory: [UDItem]) -> UDItem? {
//        for item in inventory {
//            if let flag = item.inscription?.containsString("THE ETERNAL STAR") {
//                if flag {
//                    return item
//                }
//            }
//        }
//        return nil
        
            for item in inventory {
                if (item.inscription != nil) && (item.inscription!.containsString("THE ETERNAL STAR")) {
                    return item
                }
            }
            return nil;
        
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 3"