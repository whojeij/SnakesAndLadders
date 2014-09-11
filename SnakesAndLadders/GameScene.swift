//
//  GameScene.swift
//  SnakesLadders
//
//  Created by WASSIM HOJEIJ on 03/09/14.
//  Copyright (c) 2014 hojeij. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    var labelTitle:SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
    var label:SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
    
    
    var playerButton:SKSpriteNode = SKSpriteNode(imageNamed:"dice")
    var pionOne:SKSpriteNode = SKSpriteNode(imageNamed:"pion1")
    var pionTwo:SKSpriteNode = SKSpriteNode(imageNamed:"pion2")
    
    
    
    let playerOneIcon:SKSpriteNode = SKSpriteNode(imageNamed:"pion1")
    let playerTwoIcon:SKSpriteNode = SKSpriteNode(imageNamed:"pion2")
    let winner:SKSpriteNode = SKSpriteNode(imageNamed:"winner")
    
    let diceSound = SKAction.playSoundFileNamed("dice.caf", waitForCompletion: false)
    
    
    
    var playerOne = Player()
    var playerTwo = Player()
    
    var initialRol: Int = 0
    var nbOfRoll = 0
    var tour = "playerOne"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        setup()
    }
    
    func setup() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.size = self.size
        background.zPosition = -2
        self.addChild(background)
        
        let snakesPlan = SKSpriteNode(imageNamed: "snakes")
        snakesPlan.anchorPoint = CGPoint(x:-0.05, y:-0.5)
        snakesPlan.zPosition = -2
        self.addChild(snakesPlan)
        
        playerButton.position = CGPoint(x: 160, y: 90)
        self.addChild(playerButton)
        
        pionOne.position = CGPoint(x: 80, y: 90)
        self.addChild(pionOne)
        pionTwo.position = CGPoint(x: 235, y: 90)
        self.addChild(pionTwo)
        
        labelTitle.position = CGPoint(x: 160, y: 20)
        labelTitle.fontColor = UIColor.redColor()
        labelTitle.fontSize = 12
        
        let fadeInOut: SKAction = SKAction.sequence([SKAction.fadeOutWithDuration(0.3), SKAction.fadeInWithDuration(0.3)])
        let repeatFadInOut: SKAction = SKAction.repeatActionForever(fadeInOut)
        labelTitle.runAction(repeatFadInOut)
        labelTitle.text = "Roll dice to choose the first to play"
        self.addChild(labelTitle)
        
        label.position = CGPoint(x: 160, y: 50)
        label.fontColor = UIColor.blackColor()
        label.fontSize = 12
        self.addChild(label)
        
        
        /*
        let untypedEmitter : AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(NSBundle.mainBundle().pathForResource("MyParticle", ofType: "sks")!)!;
        
        let emitter:SKEmitterNode = untypedEmitter as SKEmitterNode;
        emitter.position = CGPoint(x: 300, y: 100)

        self.addChild(emitter)
        */
        
        /*
        var diceImages = [String]()
        
        for i in 1...2 {
        diceImages.append("dice\(i)")
        println("dice\(i)")
        }
        
        let diceAction = SKAction.animateWithTextures(["dice1", "dice2"], timePerFrame: 1)
        playerButton.runAction(diceAction) */
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        winner.removeFromParent()
        
        
        
        for touch: AnyObject in touches {
            if CGRectContainsPoint(playerButton.frame, touch.locationInNode(self)) {
                
                runAction(diceSound)
                
                
                if nbOfRoll < 2 {
                    chooseFirstPlayer()
                } else {
                    labelTitle.hidden = true
                    
                    if tour == "playerOne" {
                        let firstDice = getRandomeDiceNumber()
                        let player = playerOne.moveToCase(firstDice, dice: playerButton, pion: pionOne, label: label, labelValue: "Player two turn")
                        
                        //playerOneIcon.removeFromParent()
                        //playerTwoIcon.position = CGPoint(x: 235, y: 50)
                        //self.addChild(playerTwoIcon)
                        tour = "playerTwo"
                        
                        if player {
                            self.initPlayer()
                            winner.position = CGPoint(x: 80, y: 20)
                            self.addChild(winner)
                            nbOfRoll = 0
                            labelTitle.hidden = false
                            labelTitle.text = "Player two win"
                            
                        }
                    } else {
                        let secondDice = getRandomeDiceNumber()
                        let player = playerTwo.moveToCase(secondDice, dice: playerButton, pion: pionTwo, label: label, labelValue: "Player one turn")
                        //playerTwoIcon.removeFromParent()
                        //playerOneIcon.position = CGPoint(x: 80, y: 50)
                        //self.addChild(playerOneIcon)
                        tour = "playerOne"
                        
                        
                        if player {
                            self.initPlayer()
                            winner.position = CGPoint(x: 235, y: 20)
                            self.addChild(winner)
                            nbOfRoll = 0
                            labelTitle.hidden = false
                            labelTitle.text = "Player two win"
                            
                            
                            
                        }
                    }
                }
                if nbOfRoll == 2 {
                    if chooseFirstPlayer() == "playerOne" {
                        labelTitle.text = "Player one will begin first"
                        label.text = "Player one turn"
                    } else {
                        labelTitle.text = "Player one will begin first"
                        label.text = "Player two turn"
                    }
                    
                }
            }
        }
    }
    
    func particleEmitterWithName(name : NSString) -> SKEmitterNode?
    {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "sks")
        
        var sceneData = NSData.dataWithContentsOfFile(path!, options: .DataReadingMappedIfSafe, error: nil)
        var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
        
        archiver.setClass(SKEmitterNode.self, forClassName: "SKEditorScene")
        let node = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as SKEmitterNode?
        archiver.finishDecoding()
        return node
    }
    
    func chooseFirstPlayer() -> String {
        let roll = getRandomeDiceNumber()
        
        
        switch roll {
        case 1:
            playerButton.texture = SKTexture(imageNamed: "dice1")
        case 2:
            playerButton.texture = SKTexture(imageNamed: "dice2")
        case 3:
            playerButton.texture = SKTexture(imageNamed: "dice3")
        case 4:
            playerButton.texture = SKTexture(imageNamed: "dice4")
        case 5:
            playerButton.texture = SKTexture(imageNamed: "dice5")
        case 6:
            playerButton.texture = SKTexture(imageNamed: "dice6")
        default:
            break
        }
        
        if initialRol < roll {
            tour = "playerTwo"
        } else {
            tour = "playerOne"
        }
        
        initialRol = roll
        nbOfRoll++
        
        return tour
    }
    
    func getRandomeDiceNumber() -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(6))) + 1
        return randomIndex
    }
    
    func initPlayer() {
        playerOne = Player()
        playerTwo = Player()
        let firstPionAction = SKAction.moveTo(CGPoint(x: 80, y: 90), duration: 2)
        pionOne.runAction(firstPionAction)
        let secondPionAction = SKAction.moveTo(CGPoint(x: 235, y: 90), duration: 2)
        pionTwo.runAction(secondPionAction)
        playerButton.texture = SKTexture(imageNamed: "dice")
        //playerTwoIcon.removeFromParent()
        //playerOneIcon.removeFromParent()
    }
    
}
