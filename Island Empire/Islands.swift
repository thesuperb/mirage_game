//
//  Islands.swift
//  Island Empire
//
//  Created by theSuperb on 29.01.16.
//  Copyright © 2016 theSuperb. All rights reserved.
//

import Foundation
import SpriteKit

class Island: SKSN {
    
    var or : OR
    var image : UII
    var sectors: Int // количество секторов
    var belong : Int // 0 - не открыт (в тумане), 1 - принадлежит игроку, 2 - принадлежит сопернику, 3 - открыт
    var isHome : Int // 0 - нестартовый остров, 1 - начальный остров игрока, 2- начальный остров соперника
    var level : Int // уровень острова (от этого зависят производительные мощности, защищенность и тд)
    
    
//    var sectAr : [Sector] // массив секторов
    
    init(or : OR, image : UII, sectors : Int) {
        
        self.or = or
        self.image = image
        self.sectors = sectors
        self.belong = 3
        self.isHome = 0
        self.level = 1
        
        let texture = SKTexture(image: image)
        super.init(texture: texture, color: UIC.clearColor(), size: image.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class SectorIsland : Island {
    
    override init(or : OR, image : UII, sectors : Int = 0) {
        super.init(or : or, image : image, sectors : 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
} // односекторовый остров


class HomeIsland : Island {
    
    var lifes : Int
    
    override init(or : OR, image : UII, sectors : Int = 0) {
        self.lifes = 1000
        super.init(or : or, image : image, sectors : 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
} // базовый остров




























