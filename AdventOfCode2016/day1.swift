//
//  day1.swift
//  AdventOfCode2016
//
//  Created by Oskar Larsson on 2016-12-01.
//  Copyright © 2016 Oskar Larsson. All rights reserved.
//

import Foundation
class Day1 {
    
    func start() -> Int {
        
        let input = "R5, R4, R2, L3, R1, R1, L4, L5, R3, L1, L1, R4, L2, R1, R4, R4, L2, L2, R4, L4, R1, R3, L3, L1, L2, R1, R5, L5, L1, L1, R3, R5, L1, R4, L5, R5, R1, L185, R4, L1, R51, R3, L2, R78, R1, L4, R188, R1, L5, R5, R2, R3, L5, R3, R4, L1, R2, R2, L4, L4, L5, R5, R4, L4, R2, L5, R2, L1, L4, R4, L4, R2, L3, L4, R2, L3, R3, R2, L2, L3, R4, R3, R1, L4, L2, L5, R4, R4, L1, R1, L5, L1, R3, R1, L2, R1, R1, R3, L4, L1, L3, R2, R4, R2, L2, R1, L5, R3, L3, R3, L1, R4, L3, L3, R4, L2, L1, L3, R2, R3, L2, L1, R4, L3, L5, L2, L4, R1, L4, L4, R3, R5, L4, L1, L1, R4, L2, R5, R1, R1, R2, R1, R5, L1, L3, L5, R2";
        return getRoute(input: input)
    }
    
    
    func getRoute(input: String) -> Int {
        
        let instructions = input
            .substring(to: input.endIndex)
            .components(separatedBy: ",");
        var endPosition = routeCoordinates();
        for ins in instructions {
            let instruction = ins.trimmingCharacters(in: .whitespaces);
            let index = instruction.index(instruction.startIndex, offsetBy: 1);
            let dir: String = instruction.substring(to: index);
            let s = instruction.substring(from: index)
            let steps = (s as NSString).integerValue;
            
            switch (dir) {
            case "R":
                endPosition.direction += 90
                break;
            case "L":
                endPosition.direction -= 90;
                break;
            default:
                break;
            }
            
            if (endPosition.direction == 360) {
                endPosition.direction = 0;
            } else if (endPosition.direction == -90){
                endPosition.direction = 270;
            }
            
            
            switch endPosition.direction {
            case 0:
                endPosition.y += steps;
            case 90:
                endPosition.x += steps;
            case 180:
                endPosition.y -= steps;
            case 270:
                endPosition.x -= steps;
                
            default:
                break;
            }
            
        }
        
        return abs(endPosition.x) + abs(endPosition.y);
        
    }
    
    struct routeCoordinates {
        var x = 0;
        var y = 0;
        var direction = 0;
    }
}
