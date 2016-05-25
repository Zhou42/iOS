//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
      
    // You may want to paste your Part 1 implementation of moveComplexRobot() here
        
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        // Step 2.1c
        // TODO: Save the return value of checkWalls() to a constant called myWallInfo.
        let myWallInfo = checkWalls(myRobot);
        
        // Step 2.2a
        // Categorize the robot's current location based on the number of walls
        
        // Uncomment the line of code below
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        
        // TODO: Define the constant, isTwoWayPath
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        // TODO: Define the constant, isDeadEnd
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        
        // Step 2.2b
        // Test whether the values of the above constants are correct
        
        // Step 2.3a
        // Three-way Path - else-if statements
        
        // TODO: If the robot encounters a three way junction and there IS a wall ahead, it should randomly rotate right or left. Uncomment the code below.
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isThreeWayJunction && !robotIsBlocked{
            continueStraightOrRotate(myRobot)
        
        // TODO: If the robot encounters a three way junction and there is NO wall ahead, it should continue straight or rotate (you need to write this else-if statement)
        } else if isTwoWayPath && !robotIsBlocked{
            continueStraightOrRotate(myRobot)
        // Step 2.3b
        // Two-way Path - else-if statements
            
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
            
        } else if isTwoWayPath && robotIsBlocked {
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should randomly rotate.
            randomlyRotateRightOrLeft(myRobot)
        } else if isDeadEnd && !robotIsBlocked {
        // Step 2.3c
        // Dead end - else-if statements
        
        // TODO: If the robot encounters a dead end and there is NO wall ahead it should move forward.
            myRobot.move()
        } else if isDeadEnd && robotIsBlocked {
        // TODO: If the robot encounters a dead end and there IS a wall ahead it should rotateRight().
            myRobot.rotateRight()
        }
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
}