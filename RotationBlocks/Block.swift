//
//  Block.swift
//  RotationBlocks
//
//  Created by Jordan Cappy on 4/01/2016.
//  Copyright © 2016 Jordan Cappy. All rights reserved.
//

import SpriteKit

class Block {
    // MARK: Properties
    let colour: UIColor
    
    var column: Int
    var row: Int
    //var sprite = SKSprite
    
    init(column: Int, row: Int) {
        self.column = column
        self.row = row
        self.colour = UIColor.blackColor()
    }
}
