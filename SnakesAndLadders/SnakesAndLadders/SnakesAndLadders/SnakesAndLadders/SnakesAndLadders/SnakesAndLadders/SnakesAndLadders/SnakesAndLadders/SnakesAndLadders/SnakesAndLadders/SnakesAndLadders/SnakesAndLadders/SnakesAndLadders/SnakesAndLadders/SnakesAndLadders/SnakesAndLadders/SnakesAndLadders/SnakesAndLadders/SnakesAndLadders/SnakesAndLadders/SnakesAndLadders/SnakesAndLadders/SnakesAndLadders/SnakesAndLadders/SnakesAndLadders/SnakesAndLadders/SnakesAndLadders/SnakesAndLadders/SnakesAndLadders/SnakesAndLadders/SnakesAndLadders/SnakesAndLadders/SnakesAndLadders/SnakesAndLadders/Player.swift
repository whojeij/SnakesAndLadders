//
//  Board.swift
//  SnakesLadders
//
//  Created by WASSIM HOJEIJ on 07/09/14.
//  Copyright (c) 2014 hojeij. All rights reserved.
//

import Foundation
import SpriteKit


class Player: SKScene {
    
    var diceRoll: Int = 0
    
    var board = Board()
    let ladderSound = SKAction.playSoundFileNamed("ladder.caf", waitForCompletion: false)
    let snakeSound = SKAction.playSoundFileNamed("snake.caf", waitForCompletion: false)
    let endGameSound = SKAction.playSoundFileNamed("GameOver.mp3", waitForCompletion: false)
    
    
    func moveToCase (number: Int, dice: SKSpriteNode, pion: SKSpriteNode, label: SKLabelNode, labelValue: String) -> Bool {
        diceRoll += number
        
        switch number{
        case 1:
            dice.texture = SKTexture(imageNamed: "dice1")
        case 2:
            dice.texture = SKTexture(imageNamed: "dice2")
        case 3:
            dice.texture = SKTexture(imageNamed: "dice3")
        case 4:
            dice.texture = SKTexture(imageNamed: "dice4")
        case 5:
            dice.texture = SKTexture(imageNamed: "dice5")
        case 6:
            dice.texture = SKTexture(imageNamed: "dice6")
        default:
            println("none")
        }
        
        
        println(diceRoll)
        
        if diceRoll < 31 {
            let moveAction = SKAction.moveTo(board.getBoard()[diceRoll - 1], duration: 2)
            pion.runAction(moveAction, completion: {
                
                let position = self.board.getBoard()[self.diceRoll - 1]
                
                switch self.diceRoll {
                case 3:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 21, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 22
                case 5:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 7, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 8
                case 11:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 25, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 26
                case 20:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 28, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 29
                case 17:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 3, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 4
                case 19:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 6, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 7
                case 21:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 8, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 9
                case 27:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 0, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 1
                case 30:
                    println("Partie termnée")
                    pion.runAction(self.endGameSound)
                    self.diceRoll = 0
                    break
                default:
                    label.text = labelValue
                    break
                }
            })
            
            
            if diceRoll == 30 {
                return true
            }
        } else {
            diceRoll -= number
        }
        return false
    }
    
    
    
    func movePionTo(node: SKSpriteNode, index: Int, label: SKLabelNode, labelValue: String) {
        let moveAction = SKAction.moveTo(self.board.getBoard()[index], duration: 2)
        node.runAction(moveAction, completion: {
            label.text = labelValue
        })
    }
    
    
    
    
    
    
    
}