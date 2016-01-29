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
            
            let recognizer = UIPinchGestureRecognizer(target: self, action: "gesture:")
            recognizer.delaysTouchesBegan = true
            skView.addGestureRecognizer(recognizer);
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            scene.backgroundColor = UIColor.grayColor()
            scene.size = skView.frame.size
            
            skView.presentScene(scene)
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "pauseScene:", name: "MovingToBackground", object: nil)
    }
    
    func gesture(sender : UIPinchGestureRecognizer) {
        /* Правильное безопасное раскрытие optional-ов */
        if let scene = (self.view as? SKView)?.scene {
            for node in scene.children {
                if let sprite = node as? SKSpriteNode where sprite.name == "MainNode" {
                    for child in sprite.children {
                        if let object = child as? SKSpriteNode {
                            object.removeFromParent()
                        }
                    }
                }
            }
        }
    }
    
    /* Функция паузы */
    func pauseScene(sender : AnyObject? = nil) {
        if let scene = (self.view as? SKView)?.scene as? GameScene {
            scene.mainNode.paused = true
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
