//
//  GameOverScene.swift
//  A3_MAPD724_Group5
//
//  Created by Apeksha Parmar on 2023-02-17.
//

import Foundation
import SpriteKit
import GameplayKit

class GameOverScene : SKScene
{
    //For restart button
    var restartButton: SKLabelNode!
    
    override func didMove(to view: SKView)
    {
        self.backgroundColor = SKColor.green
        
        //slot graphic
        let slotGraphic = SKSpriteNode(texture: SKTexture(imageNamed: "slot-machine"), size: CGSize(width: 400, height: 150))
        slotGraphic.position = CGPoint(x: 0, y: self.frame.size.height * 0.5 - 275)
        slotGraphic.zPosition = 1
        self.addChild(slotGraphic)
        
        //RESTART button to start game again
        restartButton = SKLabelNode(text: "RESTART")
        restartButton.position = CGPoint(x: 0, y: -100)
        restartButton.zPosition = 1
        restartButton.fontName = "Chalkduster"
        restartButton.fontSize = CGFloat(80)
        restartButton.fontColor = SKColor.black
        self.addChild(restartButton)
        
        let gameOverLbl = SKLabelNode(fontNamed: "Chalkduster")
        gameOverLbl.text = "GAME OVER!"
        gameOverLbl.fontSize = 65
        gameOverLbl.fontColor = SKColor.init(red: 132, green: 0, blue: 102, alpha: 1)
        gameOverLbl.position = CGPoint(x: 0, y: 130)
        
        addChild(gameOverLbl)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            if restartButton.contains(location)
            {
                if let view = self.view
                {
                    let startScene = SKScene(fileNamed: "GameScene")
                    startScene?.scaleMode = .aspectFill
                    view.presentScene(startScene!, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
        }
    }
    
}
