//
//  Board.swift
//  SnakesLadders
//
//  Created by WASSIM HOJEIJ on 07/09/14.
//  Copyright (c) 2014 hojeij. All rights reserved.
//

import Foundation
import SpriteKit


class Board {
    
    var board = [CGPoint(x:0, y:0)]
    
    let gridWidth = 300
    let gridHeight = 300
    let numRows = 10
    let numCols = 10
    let gridFirstCase:CGPoint = CGPoint(x: 16, y: 171)
    
    
    init() {
        for i in 0...9 {
            switch i {
            case 0, 2, 4, 6, 8:
                for j in 0...9 {
                    board.append(getTilePosition(row: i, column: j))
                }
            case 1, 3, 5, 7, 9:
                for j in 0...9 {
                    board.append(getTilePosition(row: i, column: 9-j))
                }
            default:
                break
            }
        }
    }
    
    func getBoard() -> [CGPoint]{
        return board
    }
    
    func calculateTileSize() -> CGSize {
        let tileWidth = gridWidth / numCols
        let tileHeight = gridHeight / numRows
        return CGSize(width: tileWidth, height: tileHeight)
    }
    
    
    func getTilePosition(row r:Int, column c:Int) -> CGPoint {
        let tileSize = calculateTileSize()
        let x = Int(gridFirstCase.x) + (c * (Int(tileSize.width))) + (c)
        let y = Int(gridFirstCase.y) + (r * (Int(tileSize.height))) + (r + 1)
        return CGPoint(x: x, y: y)
    }
    

    
    
    
}