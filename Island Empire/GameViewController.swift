//
//  GameViewController.swift
//  Island Empire
//
//  Created by theSuperb on 27.01.16.
//  Copyright (c) 2016 theSuperb. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        let scene = NewGameScene(size: skView.frame.size)
        
        /* Распознавание пинча */
        let recognizer = UIPinchGestureRecognizer(target: self, action: "pinchGesture:")
        recognizer.delaysTouchesBegan = true
        skView.addGestureRecognizer(recognizer);
        
        /* Распознавание свайпа от левого края экрана */
        let screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: "screenSwipeGesture:")
        screenEdgeRecognizer.delaysTouchesBegan = true
        screenEdgeRecognizer.edges = .Left
        skView.addGestureRecognizer(screenEdgeRecognizer)

        skView.ignoresSiblingOrder = true
        
        scene.scaleMode = .AspectFill
        
        scene.backgroundColor = UIColor.grayColor()
        
        skView.presentScene(scene)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "pauseScene:", name: "MovingToBackground", object: nil)
    }
    
    func screenSwipeGesture(sender : UIScreenEdgePanGestureRecognizer) {
        if let _ = (self.view as? SKView)?.scene as? GameScene {
            let transition = SKTransition.fadeWithColor(UIColor.greenColor(), duration: 0.5)
            let skView = self.view as! SKView
            let nextScene = NewGameScene(size: skView.frame.size)
            skView.presentScene(nextScene, transition: transition)
        }
    }
    
    func pinchGesture(sender : UIPinchGestureRecognizer) {
        /* Правильное безопасное раскрытие optional-ов */
        if let scene = (self.view as? SKView)?.scene as? GameScene {
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
