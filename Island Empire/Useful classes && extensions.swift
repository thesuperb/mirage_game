//
//  Useful classes && extensions.swift
//  Island Empire
//
//  Created by theSuperb on 28.01.16.
//  Copyright © 2016 theSuperb. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

typealias SKSN = SKSpriteNode
typealias SKPB = SKPhysicsBody
typealias CGF = CGFloat
typealias CGP = CGPoint
typealias CGS = CGSize
typealias CGSz = CGSize
typealias CGRt = CGRect
typealias UIC = UIColor
typealias NSUD = NSUserDefaults
typealias SKLN = SKLabelNode
typealias UIB = UIButton
typealias UII = UIImage
typealias SKT = SKTexture

extension Character {
    var keyCode: Int {
        let utf16view = String(self).utf16
        return Int(utf16view[utf16view.startIndex])
    }
}

extension String {
    
    static func random(length: Int = 20) -> String {
        
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.characters.count))
            randomString += "\(base[base.startIndex.advancedBy(Int(randomValue))])"
        }
        
        return randomString
    }
    
    func containsAnyCase(var smth:String) -> Bool {
        var index = startIndex
        smth = smth.lowercaseString
        repeat {
            let sub = self[Range(start:index++, end : endIndex)]
            if sub.lowercaseString.hasSuffix(smth) {
                return true
            }
        } while index != endIndex
        return false
    }
    
    func addOne() -> String {
        if self.isEmpty {
            return "1"
        }
        else {
            return "\(Int(self)! + 1)"
        }
    }
    
    func isNumber() -> Bool {
        if (Int(self) != nil) {
            return true
        }
        else {
            return false
        }
    }
}

func random() -> CGFloat {
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random(min min: CGFloat, max: CGFloat) -> CGFloat {
    return random() * (max - min) + min
}

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
    
    func distanseTo(dest : CGPoint) -> CGFloat {
        let x = (self.x - dest.x) * (self.x - dest.x)
        let y = (self.y - dest.y) * (self.y - dest.y)
        return abs(sqrt(x + y))
    }
}

func abs(n : CGFloat) -> CGFloat {
    if n <= 0 {
        return n
    }
    else {
        return -n
    }
}
