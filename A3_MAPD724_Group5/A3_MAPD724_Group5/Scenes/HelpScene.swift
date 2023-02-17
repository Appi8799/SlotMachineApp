//
//  HelpScene.swift
//  A3_MAPD724_Group5
//
//  Created by Apeksha Parmar on 2023-02-17.
//

import Foundation
import SpriteKit
import GameplayKit

class HelpScene : SKScene
{
    
    var backBtn: SKSpriteNode!
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.purple
        
        backBtn = SKSpriteNode(texture: SKTexture(imageNamed: "backBtn"), color: UIColor.brown, size: CGSize(width: 120, height: 120))
        backBtn.position = CGPoint(x: -230, y: 520)
        backBtn.zPosition = 1
        self.addChild(backBtn)
        
        let helpLbl = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        helpLbl.text = "HELP"
        helpLbl.fontSize = 65
        helpLbl.fontColor = SKColor.black
        helpLbl.position = CGPoint(x: frame.midX, y: 300)
           
        addChild(helpLbl)
        
        let lblLine1 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine1.text = "To play the game,"
        lblLine1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine1.fontSize = 30
        lblLine1.fontColor = SKColor.green
        lblLine1.position = CGPoint(x: -280, y: 100)
           
        addChild(lblLine1)
        
        let lblLine2 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine2.text = "first enter the bet amount and"
        lblLine2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine2.fontSize = 30
        lblLine2.fontColor = SKColor.green
        lblLine2.position = CGPoint(x: -280, y: 0)
           
        addChild(lblLine2)
        
        let lblLine3 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine3.text = "then press the 'SPIN' button"
        lblLine3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine3.fontSize = 30
        lblLine3.fontColor = SKColor.green
        lblLine3.position = CGPoint(x: -280, y: -100)
           
        addChild(lblLine3)

        let rectBox = SKShapeNode(rect: CGRect(x: -300, y: -140, width: 600, height: 280), cornerRadius: 20)
        rectBox.fillColor = UIColor.darkGray
        rectBox.strokeColor = UIColor.blue
        self.addChild(rectBox)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if backBtn.contains(location){
                
                if let view = self.view {
                    
                    let startScene = SKScene(fileNamed: "GameScene")
                    startScene?.scaleMode = .aspectFill
                    view.presentScene( startScene!, transition: SKTransition.fade(withDuration: 0.5) )
                }
            }
        }
        
    }
}

