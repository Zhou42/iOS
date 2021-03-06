//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
    let isWooden: Bool
    

// TODO: Add the computed property, cells.
    var cells: [GridLocation] {
        get {
            // Hint: These two constants will come in handy
            let start = self.location
            let end: GridLocation = ShipEndLocation(self)
            
            // Hint: The cells getter should return an array of GridLocations.
            var occupiedCells = [GridLocation]()
            if start.x == end.x {
                for i in start.y...end.y {
                    occupiedCells.append(GridLocation(x: start.x, y: i))
                }
            } else if start.y == end.y {
                for i in start.x...end.x {
                    occupiedCells.append(GridLocation(x: i, y: start.y))
                }
            }
            
            
            return occupiedCells
        }
    }
    
    var hitTracker: HitTracker
// TODO: Add a getter for sunk. Calculate the value returned using hitTracker.cellsHit.
    var sunk: Bool {
        get {
              var isSunk = true
//            if self.isVertical {
//                for i in 1...length {
//                    if !(hitTracker.cellsHit[GridLocation(x: self.location.x, y: self.location.y + i - 1)]!) {
//                        isSunk = false
//                        break
//                    }
//                }
//            } else {
//                for i in 1...length {
//                    if !(hitTracker.cellsHit[GridLocation(x: self.location.x + i - 1, y: self.location.y)]!) {
//                        isSunk = false
//                        break
//                    }
//                }
//            }
//            // print(isSunk)
            for key in hitTracker.cellsHit.keys {
                if !(hitTracker.cellsHit[key]!) {
                    isSunk = false
                    break
                }
            }
            // print(isSunk)
            return isSunk
        }
    }

// TODO: Add custom initializers
    init(length: Int, location: GridLocation, isVertical: Bool) {
        self.length = length
        self.hitTracker = HitTracker()
        self.isVertical = isVertical
        self.isWooden = true
        self.location = location
    }
}

// TODO: Change Cell protocol to PenaltyCell and add the desired properties
protocol Cell {
    var location: GridLocation {get}
}

// TODO: Adopt and implement the PenaltyCell protocol
struct Mine: Cell {
    let location: GridLocation

}

// TODO: Adopt and implement the PenaltyCell protocol
struct SeaMonster: Cell {
    let location: GridLocation
}

class ControlCenter {
    
    func placeItemsOnGrid(human: Human) {
        
//        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 4), isVertical: true, isWooden: true, hitTracker: HitTracker())
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 4), isVertical: true)
        // print(smallShip.cells)
        human.addShipToGrid(smallShip)
        
//        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false, isWooden: false, hitTracker: HitTracker())
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        // print(mediumShip1.cells)
        human.addShipToGrid(mediumShip1)
        
//        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 3, y: 1), isVertical: false, isWooden: false, hitTracker: HitTracker())
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 3, y: 1), isVertical: false)
        human.addShipToGrid(mediumShip2)
        
//        let largeShip = Ship(length: 4, location: GridLocation(x: 6, y: 3), isVertical: true, isWooden: false, hitTracker: HitTracker())
        let largeShip = Ship(length: 4, location: GridLocation(x: 6, y: 3), isVertical: true)
        human.addShipToGrid(largeShip)
        
//        let xLargeShip = Ship(length: 5, location: GridLocation(x: 7, y: 2), isVertical: true, isWooden: false, hitTracker: HitTracker())
        let xLargeShip = Ship(length: 5, location: GridLocation(x: 7, y: 2), isVertical: true)
        human.addShipToGrid(xLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 6, y: 0))
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 3, y: 3))
        human.addMineToGrid(mine2)
        
        let seamonster1 = SeaMonster(location: GridLocation(x: 5, y: 6))
        human.addSeamonsterToGrid(seamonster1)
        
        let seamonster2 = SeaMonster(location: GridLocation(x: 2, y: 2))
        human.addSeamonsterToGrid(seamonster2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let sinkBonus = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus
        let shipBonus = (5 - gameStats.humanShipsSunk) * gameStats.shipBonus
        let guessPenalty = (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
        
        finalScore = sinkBonus + shipBonus - guessPenalty
        
        return finalScore
    }
}