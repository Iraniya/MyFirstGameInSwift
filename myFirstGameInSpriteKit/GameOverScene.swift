//
//  GameOverScene.swift
//  myFirstGameInSpriteKit
//
//  Created by Shilpy Samaddar on 08/01/18.
//  Copyright © 2018 iraniya. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, score: Int) {
        super .init(size: size)
        var currentHighscore: Int = 0
        let userDefaults = UserDefaults.standard
        if let highscore:Int = (userDefaults.value(forKey: "highscore") as? Int) {
           currentHighscore = highscore
        }
        if score > currentHighscore {
            //If the new highscore is higher then the current highscore, save it.
            userDefaults.set(score, forKey: "highscore")
            print("highscore: \(score) and current: \(currentHighscore)")
            let message = "New Highscore = \(score)"
            self.addLabel(withText: message, andPosition: CGPoint(x: size.width/2, y: size.height/2))
        } else {
            //If there isn't a highscore set yet, every highscore is higher then nothing. So add it.
            userDefaults.set(score, forKey: "highscore")
            print(score)
            //display both score
            //add your score
            let yourScore = "Your score = \(score)"
            self.addLabel(withText: yourScore, andPosition: CGPoint(x: size.width/2, y: size.height*2/3))
            
            let message = "Highscore = \(currentHighscore)"
            self.addLabel(withText: message, andPosition: CGPoint(x: size.width/2, y: size.height/3))
            
            print("nothighscore: \(score) and current: \(currentHighscore)")
        }
        
    
        backgroundColor = SKColor.white
        
//        if isHighScore {
//            //your score is highscore
//            let message = "New Highscore = \(score)"
//            self.addLabel(withText: message, andPosition: CGPoint(x: size.width/2, y: size.height/2))
//        }
//        else {
//            //display both score
//            //add your score
//            let yourScore = "Your score = \(score)"
//            self.addLabel(withText: yourScore, andPosition: CGPoint(x: size.width/2, y: size.height/2))
//
//            let message = "Highscore = \(highScore)"
//            self.addLabel(withText: message, andPosition: CGPoint(x: size.width/2, y: size.height/4))
//        }
        
//        let message = "Your Score =  \(score)"
//
//        let label = SKLabelNode(fontNamed: "Chalkduster")
//        label.text = message
//        label.fontSize = 40
//        label.fontColor = SKColor.black
//        label.position = CGPoint(x: size.width/2, y: size.height/2)
//        addChild(label)
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run() {
                let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                let scene  = GameScene(size: size)
                self.view?.presentScene(scene, transition: reveal)
            }]))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(withText: String, andPosition position: CGPoint) {
        let message = withText
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.black
        label.position = position
        addChild(label)
    }
    
    func saveHighscore(score:Int) -> Int {
        let userDefault = UserDefaults.standard
        
        //Check if there is already a highscore
        if let currentHighscore:Int = userDefault.value(forKey: "highscore") as? Int {
            //If the new highscore is higher then the current highscore, save it.
            if(score > currentHighscore){
                userDefault.set(score, forKey: "highscore")
                print("highscore: \(score) and current: \(currentHighscore)")
                return score
            }
            return currentHighscore
        } else{
            //If there isn't a highscore set yet, every highscore is higher then nothing. So add it.
            userDefault.set(score, forKey: "highscore")
            print(score)
            return score
        }
        
        return 0
    }
}
