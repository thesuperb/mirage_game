//
//  GameViewController.swift
//  Island Empire
//
//  Created by Roman Nikitin on 27.01.16.
//  Copyright (c) 2016 theSuperb. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            skView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: "gesture:"));
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }
    
    func gesture(sender : UIPinchGestureRecognizer) {
        /* Правильное безопасное раскрытие optional-ов */
        if let scene = (self.view as? SKView)?.scene {
            for node in scene.children {
                if let sprite = node as? SKSpriteNode {
                    sprite.removeFromParent()
                }
            }
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
