//
//  Sectors.swift
//  Island Empire
//
//  Created by Mark Mark on 1/29/16.
//  Copyright © 2016 theSuperb. All rights reserved.
//

import Foundation
import SpriteKit

class Sector {
    var owner : Island
    var level : Int = 0
    
    required init (_owner : Island) {
        owner = _owner
    }
}