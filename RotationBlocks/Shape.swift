//
//  Shape.swift
//  RotationBlocks
//
//  Created by Jordan Cappy on 4/01/2016.
//  Copyright © 2016 Jordan Cappy. All rights reserved.
//

import SpriteKit


/*
    the idea here is that a 'shape' will be the objects on the game board

    each shape will be a collection of Block indexes based on the original starting shape

    an original shape will start like so

    [0][1]

    and then as other blocks become attached to it it will get larger like so

    [-1,0][0,0][1,0][2,0]
          [0,1][1,1]

*/

class Shape {
    // MARK: Properties
    
    var blocks: [[Block]]?
    var falling: Bool
    
    init() {
        self.falling = true
        
        
    }
}
