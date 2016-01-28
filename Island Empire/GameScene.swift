//
//  GameScene.swift
//  Island Empire
//
//  Created by Roman Nikitin on 27.01.16.
//  Copyright (c) 2016 theSuperb. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var actionsDictionary = [SKSpriteNode:[(operation : SKAction, key : String)]]()
    var actionsKeys = [String]()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            let key = String.random()
            sprite.runAction(SKAction.repeatActionForever(action), withKey: key)
            actionsKeys.append(key);
            
            self.addChild(sprite)
        }
    }
    
    /* Останавливает все SKAction в этой сцене */
    func pauseActions(sender : AnyObject? = nil) {
        for node in self.children {
            if let sprite = node as? SKSpriteNode {
                for key in actionsKeys {
                    if let action = sprite.actionForKey(key) {
                        sprite.removeActionForKey(key);
                        actionsDictionary[sprite]?.append((action, key));
                    }
                }
            }
        }
        actionsKeys.removeAll()
    }
    
    /* Возообновляет все SKAction, остановленные функцией pauseActions */
    func resumeActions(sender : AnyObject? = nil) {
        for sprite in actionsDictionary.keys {
            while !actionsDictionary[sprite]!.isEmpty {
                sprite.runAction(actionsDictionary[sprite]!.first!.operation, withKey: actionsDictionary[sprite]!.first!.key)
                actionsKeys.append(actionsDictionary[sprite]!.first!.key)
                actionsDictionary[sprite]!.removeFirst()
            }
        }
        actionsDictionary.removeAll()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
