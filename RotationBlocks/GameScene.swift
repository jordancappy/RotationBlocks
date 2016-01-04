//
//  GameScene.swift
//  RotationBlocks
//
//  Created by Jordan Cappy on 2/01/2016.
//  Copyright (c) 2016 Jordan Cappy. All rights reserved.
//

import SpriteKit

// MARK: Constants
let NumberOfColumns = 10

let StartingTickLength = NSTimeInterval(1000)

class GameScene: SKScene {
    
    // MARK: Properties
    
    let gameLayer = SKNode()
    let shapeLayer = SKNode()
    
    var lastTick: NSDate?
    var tickLength = StartingTickLength
    var tick: (() -> ())?
    
    // testing
    var sprite: SKSpriteNode?
    var positionIndex: Int?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)

        
        let gameBoard = SKSpriteNode.init(color: UIColor.whiteColor(),
            size: CGSize.init(width: (20 * NumberOfColumns), height: (20 * NumberOfColumns)))
        gameBoard.anchorPoint = CGPoint(x: 0, y: 1)
        gameBoard.position = CGPoint(x: 6, y: -6)
        addChild(gameLayer)
    
        self.shapeLayer.position = CGPoint(x: 6, y: -6)
        
        gameLayer.addChild(gameBoard)
        
        gameLayer.addChild(shapeLayer)
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        guard let lastTick = lastTick else {
            return
        }
        
        let timePassed = lastTick.timeIntervalSinceNow * -1000
        
        if timePassed > tickLength {
            updateLastTick()
            
            tick?()
        }
    }
    
    func addNewShapeToScene() {
        // testing, remove this constant
        let blockSize:CGSize = CGSize(width: 20, height:20)
        let sprite = SKSpriteNode(color: UIColor.redColor(), size: blockSize)
        
        shapeLayer.addChild(sprite)
        
        self.sprite = sprite
        
        // test start move action
        let startingPosition = CGPoint.init(x: 0, y: 0)
        self.positionIndex = 0
        let moveAction = SKAction.moveTo(startingPosition, duration: NSTimeInterval(0.2))
        moveAction.timingMode = .EaseOut
        
        // fade in the block
        let fadeInAction = SKAction.fadeAlphaTo(0.7, duration: 0.4)
        fadeInAction.timingMode = .EaseOut
        
        sprite.runAction(SKAction.group([moveAction, fadeInAction]))
        
    }
    
    func moveShape(shape:Shape, completion: () -> ()) {
        let sprite = self.sprite
        
        let moveTo = CGPoint.init(x: 0, y: (self.positionIndex!++ * 20))
        let moveToAction = SKAction.moveTo(moveTo, duration: 0.4)
        moveToAction.timingMode = .EaseOut
        
        sprite?.runAction(moveToAction)
    }
    
    
    func startTicking() {
        lastTick = NSDate()
    }
    
    // set the last tick to the current date time
    func updateLastTick() {
        lastTick = NSDate()
    }
    
    
}
