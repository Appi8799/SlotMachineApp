//
//  DocumentationScene.swift
//  A3_MAPD724_Group5
//
//  Created by Apeksha Parmar on 2023-02-17.
//

import Foundation
import SpriteKit
import GameplayKit

class DocumentationScene : SKScene
{
    var backBtn: SKSpriteNode!
        
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.purple
        
        backBtn = SKSpriteNode(texture: SKTexture(imageNamed: "backBtn"), color: UIColor.brown, size: CGSize(width: 120, height: 120))
        backBtn.position = CGPoint(x: -230, y: 520)
        backBtn.zPosition = 1
        self.addChild(backBtn)
        
        let documentationLbl = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        documentationLbl.text = "DOCUMENTATION"
        documentationLbl.fontSize = 55
        documentationLbl.fontColor = SKColor.black
        documentationLbl.position = CGPoint(x: frame.midX, y: 300)
           
        addChild(documentationLbl)
        
        let lblLine1 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine1.text = "SLOT MACHINE APPLICATION"
        lblLine1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine1.fontSize = 30
        lblLine1.fontColor = SKColor.green
        lblLine1.position = CGPoint(x: -280, y: 100)
           
        addChild(lblLine1)
        
        let lblLine2 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine2.text = "Application Developers:"
        lblLine2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine2.fontSize = 30
        lblLine2.fontColor = SKColor.green
        lblLine2.position = CGPoint(x: -280, y: 0)
           
        addChild(lblLine2)
        
        let lblLine3 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine3.text = "1. Apeksha Parmar (301205325)"
        lblLine3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine3.fontSize = 30
        lblLine3.fontColor = SKColor.green
        lblLine3.position = CGPoint(x: -280, y: -100)
           
        addChild(lblLine3)

        let lblLine4 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine4.text = "2. Ajay Shrivastav (301284668)"
        lblLine4.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine4.fontSize = 30
        lblLine4.fontColor = SKColor.green
        lblLine4.position = CGPoint(x: -280, y: -200)
           
        addChild(lblLine4)
        
        let lblLine5 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine5.text = "3. Brijen Shah (301271637)"
        lblLine5.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine5.fontSize = 30
        lblLine5.fontColor = SKColor.green
        lblLine5.position = CGPoint(x: -280, y: -300)
           
        addChild(lblLine5)
        
        let lblLine6 = SKLabelNode(fontNamed: "Chalkduster")
        lblLine6.text = "VERSION 1.1"
        lblLine6.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblLine6.fontSize = 30
        lblLine6.fontColor = SKColor.green
        lblLine6.position = CGPoint(x: -280, y: -500)
           
        addChild(lblLine6)
        
        let rectBox = SKShapeNode(rect: CGRect(x: -300, y: -540, width: 600, height: 690), cornerRadius: 20)
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
