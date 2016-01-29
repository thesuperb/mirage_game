//
//  GameScene.swift
//  Island Empire
//
//  Created by theSuperb on 27.01.16.
//  Copyright (c) 2016 theSuperb. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* Основная текстура, добавлять все объекты на неё */
    var mainNode = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        mainNode = SKSpriteNode(color: UIColor.redColor(), size: self.size)
        mainNode.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        mainNode.zPosition = -2
        mainNode.name = "MainNode"
        
        self.addChild(mainNode)
        
        let label = SKLabelNode(text: "Finally")
        label.fontSize = 40
        label.position = CGPointZero
        label.fontName = "Helvetica"
        mainNode.addChild(label)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */

        for touch in touches {
            let location = touch.locationInNode(mainNode)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.25
            sprite.yScale = 0.25
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            mainNode.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
