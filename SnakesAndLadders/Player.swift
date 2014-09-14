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
        
        if diceRoll < 101 {
            let moveAction = SKAction.moveTo(board.getBoard()[diceRoll], duration: 2)
            pion.runAction(moveAction, completion: {
                
                let position = self.board.getBoard()[self.diceRoll - 1]
                
                switch self.diceRoll {
                case 7:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 11, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 11
                case 20:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 38, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 38
                case 28:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 65, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 65
                case 36:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 44, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 44
                case 42:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 63, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 63
                case 51:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 67, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 67
                case 62:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 81, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 81
                case 71:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 90, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 90
                case 86:
                    pion.runAction(
                        self.ladderSound,
                        completion: {
                            self.movePionTo(pion, index: 97, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 97
                    
                    
                    
                    
                case 25:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 3, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 3
                case 56:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 48, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 48
                case 59:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 1, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 1
                case 69:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 32, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 32
                case 83:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 57, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 57
                case 91:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 73, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 73
                case 94:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 26, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 26
                case 99:
                    pion.runAction(
                        self.snakeSound,
                        completion: {
                            self.movePionTo(pion, index: 8, label: label, labelValue: labelValue)
                    })
                    self.diceRoll = 8
                case 100:
                    println("Partie termnée")
                    pion.runAction(self.endGameSound)
                    self.diceRoll = 0
                    break
                default:
                    label.text = labelValue
                    break
                }
            })
            
            
            if diceRoll == 100 {
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