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
    
    func levelUp() {
        level++
    }
}

class MilitarySector: Sector {
    required init(_owner: Island) {
        super.init(_owner: _owner)
    }
}

class ScientificSector: Sector {
    required init(_owner: Island) {
        super.init(_owner: _owner)
    }
}

class SocialSector: Sector {
    required init(_owner: Island) {
        super.init(_owner: _owner)
    }
}

class DimplomaticSector: Sector {
    required init(_owner: Island) {
        super.init(_owner: _owner)
    }
}

class FoodStuffSector: Sector {
    required init(_owner: Island) {
        super.init(_owner: _owner)
    }
}