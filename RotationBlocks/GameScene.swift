//
//  GameScene.swift
//  RotationBlocks
//
//  Created by Jordan Cappy on 2/01/2016.
//  Copyright (c) 2016 Jordan Cappy. All rights reserved.
//

import SpriteKit

// MARK: Constants

let StartingTickLength = NSTimeInterval(1000)

class GameScene: SKScene {
    
    // MARK: Properties
    
    let gameLayer = SKNode()
    
    var lastTick: NSDate?
    var tickLength = StartingTickLength
    var tick: (() -> ())?
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        
        addChild(gameLayer)
        
        
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
    
    func startTicking() {
        lastTick = NSDate()
    }
    
    // set the last tick to the current date time
    func updateLastTick() {
        lastTick = NSDate()
    }
    
    
}
