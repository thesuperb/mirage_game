//
//  NewGameScene.swift
//  Island Empire
//
//  Created by Roman Nikitin on 29.01.16.
//  Copyright © 2016 theSuperb. All rights reserved.
//

import Foundation
import SpriteKit

class NewGameScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        /* Кнопка для перехода на следующую сцену */
        let newGameButton = SgButton(normalString: "New Game", normalFontName: "Helvetica", normalFontSize: 40, normalStringColor: UIColor.blueColor(), backgroundNormalColor: UIColor.whiteColor(), size: CGSz(width: 300, height: 50), cornerRadius: CGF(10), buttonFunc: newGameButtonPressed)
        newGameButton.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(newGameButton)
    }
    
    /* Переход к следующей сцене */
    func newGameButtonPressed(sender : AnyObject?) {
        let transition = SKTransition.fadeWithColor(UIColor.redColor(), duration: NSTimeInterval(1))
        let scene = GameScene(size: (self.view?.frame.size)!)
        scene.size = (self.view?.frame.size)!
        
        self.view?.presentScene(scene, transition: transition)
    }
    
    override func update(currentTime: NSTimeInterval) {
        
    }
}
