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
    
    let gridWidth = 270
    let gridHeight = 300
    let numRows = 5
    let numCols = 6
    let gridFirstCase:CGPoint = CGPoint(x: 40, y: 170)
    
    
    init() {
        board[0] = getTilePosition(row: 0, column: 0)
        board.append(getTilePosition(row: 0, column: 1))
        board.append(getTilePosition(row: 0, column: 2))
        board.append(getTilePosition(row: 0, column: 3))
        board.append(getTilePosition(row: 0, column: 4))
        board.append(getTilePosition(row: 0, column: 5))
        
        board.append(getTilePosition(row: 1, column: 5))
        board.append(getTilePosition(row: 1, column: 4))
        board.append(getTilePosition(row: 1, column: 3))
        board.append(getTilePosition(row: 1, column: 2))
        board.append(getTilePosition(row: 1, column: 1))
        board.append(getTilePosition(row: 1, column: 0))
        
        board.append(getTilePosition(row: 2, column: 0))
        board.append(getTilePosition(row: 2, column: 1))
        board.append(getTilePosition(row: 2, column: 2))
        board.append(getTilePosition(row: 2, column: 3))
        board.append(getTilePosition(row: 2, column: 4))
        board.append(getTilePosition(row: 2, column: 5))
        
        board.append(getTilePosition(row: 3, column: 5))
        board.append(getTilePosition(row: 3, column: 4))
        board.append(getTilePosition(row: 3, column: 3))
        board.append(getTilePosition(row: 3, column: 2))
        board.append(getTilePosition(row: 3, column: 1))
        board.append(getTilePosition(row: 3, column: 0))
        
        board.append(getTilePosition(row: 4, column: 0))
        board.append(getTilePosition(row: 4, column: 1))
        board.append(getTilePosition(row: 4, column: 2))
        board.append(getTilePosition(row: 4, column: 3))
        board.append(getTilePosition(row: 4, column: 4))
        board.append(getTilePosition(row: 4, column: 5))
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
        let x = Int(gridFirstCase.x) + (c * (Int(tileSize.width)))
        let y = Int(gridFirstCase.y) + (r * (Int(tileSize.height)))
        return CGPoint(x: x, y: y)
    }
    
    
    
}