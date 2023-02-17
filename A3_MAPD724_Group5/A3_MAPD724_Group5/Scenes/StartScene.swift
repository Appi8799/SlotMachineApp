//
//  StartScene.swift
//  A3_MAPD724_Group5
//
//  Created by Apeksha Parmar on 2023-02-17.
//

import Foundation
import SpriteKit
import GameplayKit

class StartScene : SKScene
{
    //For start button
    var startBtn: SKLabelNode!
    //For Help button
    var helpBtn: SKLabelNode!
    //For Support button
    var supportBtn: SKLabelNode!
    //For Documentation button
    var documentationBtn: SKLabelNode!
    
    override func didMove(to view: SKView)
    {
        self.backgroundColor = SKColor.green
        
        //slot graphic
        let slotGraphic = SKSpriteNode(texture: SKTexture(imageNamed: "slot-machine"), size: CGSize(width: 400, height: 150))
        slotGraphic.position = CGPoint(x: 0, y: self.frame.size.height * 0.5 - 245)
        slotGraphic.zPosition = 1
        self.addChild(slotGraphic)
        
        // START button
        startBtn = SKLabelNode(text: "START")
        startBtn.position = CGPoint(x: 0, y: 0)
        startBtn.zPosition = 1
        startBtn.fontName = "Chalkduster"
        startBtn.fontSize = CGFloat(100)
        startBtn.fontColor = SKColor.init(red: 132, green: 0, blue: 102, alpha: 1)
        self.addChild(startBtn)
        
        // HELP button
        helpBtn = SKLabelNode(text: "Help")
        helpBtn.position = CGPoint(x: -200, y: -300)
        helpBtn.zPosition = 1
        helpBtn.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        helpBtn.fontName = "AmericanTypewriter-Bold"
        helpBtn.fontSize = CGFloat(25)
        helpBtn.fontColor = SKColor.black
        self.addChild(helpBtn)
        
        // SUPPORT button
        supportBtn = SKLabelNode(text: "Support")
        supportBtn.position = CGPoint(x: -200, y: -350)
        supportBtn.zPosition = 1
        supportBtn.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        supportBtn.fontName = "AmericanTypewriter-Bold"
        supportBtn.fontSize = CGFloat(25)
        supportBtn.fontColor = SKColor.black
        self.addChild(supportBtn)
        
        // DOCUMENTATION button
        documentationBtn = SKLabelNode(text: "Documentation")
        documentationBtn.position = CGPoint(x: -200, y: -400)
        documentationBtn.zPosition = 1
        documentationBtn.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        documentationBtn.fontName = "AmericanTypewriter-Bold"
        documentationBtn.fontSize = CGFloat(25)
        documentationBtn.fontColor = SKColor.black
        self.addChild(documentationBtn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if startBtn.contains(location){
                if let view = self.view {
                    if let scene = SKScene(fileNamed: "GameScene") {
                        scene.scaleMode = .aspectFill
                        view.presentScene(scene)
                    }
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
            
            if helpBtn.contains(location){
                
                if let view = self.view {
                    
                    let helpScene = SKScene(fileNamed: "HelpScene")
                    helpScene?.scaleMode = .aspectFill
                    view.presentScene( helpScene!, transition: SKTransition.fade(withDuration: 0.5) )
                }
            }
            
            if supportBtn.contains(location){
                
                if let view = self.view {
                    
                    let helpScene = SKScene(fileNamed: "SupportScene")
                    helpScene?.scaleMode = .aspectFill
                    view.presentScene( helpScene!, transition: SKTransition.fade(withDuration: 0.5) )
                }
            }
            
            if documentationBtn.contains(location){
                
                if let view = self.view {
                    
                    let helpScene = SKScene(fileNamed: "DocumentationScene")
                    helpScene?.scaleMode = .aspectFill
                    view.presentScene( helpScene!, transition: SKTransition.fade(withDuration: 0.5) )
                }
            }
        }
    }
}
