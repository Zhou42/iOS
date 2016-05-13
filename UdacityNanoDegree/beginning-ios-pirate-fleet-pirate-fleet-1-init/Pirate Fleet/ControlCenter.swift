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
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x:0, y:0), isVertical: false)
        human.addShipToGrid(mediumShip1)
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x:0, y:1), isVertical: false)
        human.addShipToGrid(mediumShip2)
        
        let smallShip = Ship(length: 2, location: GridLocation(x:0, y:2), isVertical: false)
        human.addShipToGrid(smallShip)
        
        let largeShip = Ship(length: 4, location: GridLocation(x:0, y:4), isVertical: false)
        human.addShipToGrid(largeShip)
        
        let extraLargeShip = Ship(length: 5, location: GridLocation(x:0, y:5), isVertical: false)
        human.addShipToGrid(extraLargeShip)
        
        let mine1 = Mine(location: GridLocation(x:5, y:5), explosionText: "HaHa")
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x:6, y:6), explosionText: "HaHa")
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus + (5 - gameStats.humanShipsSunk) * gameStats.shipBonus - (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
        print("the value of final score is \(finalScore)")
        return finalScore
    }
}