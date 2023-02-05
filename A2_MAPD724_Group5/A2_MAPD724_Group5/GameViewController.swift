//
//  GameScene.swift
//  Filename: A2_MAPD724_Group5
//
//  Student Name: Apeksha Parmar (301205325)
//      Ajay Shrivastav (301284668)
//      Brijen Jayeshbhai Shah (301271637)
//
//  App Description: Slot Machine - Part 2 - Basic App Functionality
//
//  Created by Apeksha Parmar on 2023-02-01.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GKScene(fileNamed: "GameScene")
        {
            if let sceneNode = scene.rootNode as! GameScene?
            {
                sceneNode.scaleMode = .aspectFill
                if let view = self.view as! SKView?
                {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                }
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
