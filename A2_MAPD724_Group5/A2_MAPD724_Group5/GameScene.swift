//
//  GameScene.swift
//  A2_MAPD724_Group5
//
//  Student Name: Apeksha Parmar (301205325)
//      Ajay Shrivastav (301284668)
//      Brijen Jayeshbhai Shah (301271637)
//
//  App Description: Slot Machine - Part 2 - Basic App Functionality
//
//  Created by Apeksha Parmar on 2023-02-01.
//

import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    let slotOptions = ["blank", "bell", "cherry", "coin", "grape", "strawberry", "seven"]
    
    var blank: Int32 = 0
    var bell: Int32 = 0
    var cherry: Int32 = 0
    var coin: Int32 = 0
    var grape: Int32 = 0
    var strawberry: Int32 = 0
    var seven: Int32 = 0
    
    // Spin button
    var spinButton: SKSpriteNode!
    // RESET button
    var resetButton: SKNode!
    // QUIT button
    var quitButton: SKNode!
    
    // 3 spin images as default images
    var spin_1: SKSpriteNode!
    var spin_2: SKSpriteNode!
    var spin_3: SKSpriteNode!
    
    // To control wheel action
    var wheelAction: Bool = false
    
    
    // Starting credit amount & current reel values
    var currentWheelValue1: String = ""
    var currentWheelValue2: String = ""
    var currentWheelValue3: String = ""
    let initialCredit = 200;
    
    var winPadLabel: SKLabelNode!
    
    // Result label
    var winPad: SKLabelNode!
    
    // Credit label
    var creditAmount: SKLabelNode!
    var credit: Int = 200 {
        didSet {
            creditAmount.text = "$ \(credit)"
        }
    }
    
    var jackpot: Int = 100000 {
        didSet {
            jackpotNumber.text = "\(jackpot)"
        }
    }
    
    var jackpotNumber: SKLabelNode!
    var jackpotLabel: SKLabelNode!
    
    // Bet label
    var currentBetLabel: SKLabelNode!
    var currentBetNumber: SKLabelNode!
    var bet: Int = 0 {
        didSet {
            currentBetNumber.text = "\(bet)"
        }
    }
    
    // BETS 10 20 50 100
    var betLabel_10: SKLabelNode!
    var betLabel_20: SKLabelNode!
    var betLabel_50: SKLabelNode!
    var betLabel_100: SKLabelNode!
    
    var labelFontName: String = "AmericanTypewriter-Bold"
    var numberFontName: String = "BanglaSangamMN-Bold"
    var labelFontSize: Int = 25
    var numberFontSize: Int = 30
    
    // WINNER PAID
    var winnerPaidLabel: SKLabelNode!
    var winnerPaidNumber: SKLabelNode!
    var winnerPaid:Int = 0 {
        didSet {
            winnerPaidNumber.text = "$ \(winnerPaid)"
        }
    }
    
    override func sceneDidLoad() {
        
        
    }
    
    override func didMove(to view: SKView) {
        
        // Graphics
        let slotGraphic = SKSpriteNode(texture: SKTexture(imageNamed: "slot-machine"), size: CGSize(width: 400, height: 150))
        slotGraphic.position = CGPoint(x: self.frame.size.width * 0.5 - 380, y: self.frame.size.height * 0.5 - 145)
        slotGraphic.zPosition = 1
        self.addChild(slotGraphic)
        
//        let sevenLogo1 = SKSpriteNode(texture: SKTexture(imageNamed: "seven"), size: CGSize(width: 95.969, height: 108.33))
//        sevenLogo1.position = CGPoint(x: -138.957, y: 389.236)
//        sevenLogo1.zRotation = -24.441
//        sevenLogo1.zPosition = 0
//        self.addChild(sevenLogo1)
//
//        let sevenLogo2 = SKSpriteNode(texture: SKTexture(imageNamed: "seven"), size: CGSize(width: 95.969, height: 108.33))
//        sevenLogo2.position = CGPoint(x: -193.087, y: 363.237)
//        sevenLogo2.zRotation = -24.441
//        sevenLogo2.zPosition = 0
//        self.addChild(sevenLogo2)
//
//        let sevenLogo3 = SKSpriteNode(texture: SKTexture(imageNamed: "seven"), size: CGSize(width: 95.969, height: 108.33))
//        sevenLogo3.position = CGPoint(x: -248.807, y: 340.237)
//        sevenLogo3.zRotation = -24.441
//        sevenLogo3.zPosition = 0
//        self.addChild(sevenLogo3)
        
        // Jackpot Label
        jackpotLabel = SKLabelNode(text: "JACKPOT")
        jackpotLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 550, y: self.frame.size.height * 0.5 - 260)
        jackpotLabel.zPosition = 1
        jackpotLabel.fontName = labelFontName
        jackpotLabel.fontSize = CGFloat(36)
        jackpotLabel.fontColor = UIColor.black
        self.addChild(jackpotLabel)
        
        let jackpotBkgnd = SKShapeNode(rect: CGRect(x: -275, y: 360, width: 200, height: 80), cornerRadius: 20)
        jackpotBkgnd.fillColor = UIColor.yellow
        self.addChild(jackpotBkgnd)
        
        // Jackpot Number
        jackpotNumber = SKLabelNode(text: "10000")
        jackpotNumber.position = CGPoint(x: self.frame.size.width * 0.5 - 550, y: self.frame.size.height * 0.5 - 300)
        jackpotNumber.zPosition = 1
        jackpotNumber.fontName = numberFontName
        jackpotNumber.fontSize = CGFloat(40)
        jackpotNumber.fontColor = UIColor.black
        self.addChild(jackpotNumber)
        
        //money logo
        let moneyBag = SKSpriteNode(texture: SKTexture(imageNamed: "moneyBag"), size: CGSize(width: 53.544, height: 41.791))
        moneyBag.position = CGPoint(x: -32.228, y: 396.467)
        moneyBag.zPosition = 1
        self.addChild(moneyBag)
        
        // Credit amount display
        creditAmount = SKLabelNode(text: "$ \(initialCredit)")
        creditAmount.position = CGPoint(x: self.frame.size.width * 0.5 - 200, y: self.frame.size.height * 0.5 - 285)
        creditAmount.zPosition = 1
        creditAmount.fontName = numberFontName
        creditAmount.fontSize = 45
        creditAmount.fontColor = UIColor.black
        self.addChild(creditAmount)
        
        // SPIN button
        spinButton = SKSpriteNode(texture: SKTexture(imageNamed: "spin"), color: UIColor.white, size: CGSize(width: 250, height: 120))
        spinButton.position = CGPoint(x: 0, y: -390)
        spinButton.zPosition = 1
        self.addChild(spinButton)
        
        // RESET button
        resetButton = SKSpriteNode(texture: SKTexture(imageNamed: "reset"), size: CGSize(width: 180, height: 120))
        resetButton.position = CGPoint(x: -150, y: -500)
        resetButton.zPosition = 1
        self.addChild(resetButton)
        
        // QUIT button
        quitButton = SKSpriteNode(texture: SKTexture(imageNamed: "quit"), color: UIColor.white, size: CGSize(width: 200, height: 79))
        quitButton.position = CGPoint(x: 180, y: -500)
        quitButton.zPosition = 1
        self.addChild(quitButton)
        
        // 3 spins
        spin_1 = SKSpriteNode(imageNamed: "seven")
        spin_1.size = CGSize(width: 150, height: 150)
        spin_1.position = CGPoint(x: -160, y: 0)
        spin_1.zPosition = 1
        self.addChild(spin_1)
        // 2 spin
        spin_2 = SKSpriteNode(imageNamed: "seven")
        spin_2.size = CGSize(width: 150, height: 150)
        spin_2.position = CGPoint(x: 0, y: 0)
        spin_2.zPosition = 1
        self.addChild(spin_2)
        // 3 spin
        spin_3 = SKSpriteNode(imageNamed: "seven")
        spin_3.size = CGSize(width: 150, height: 150)
        spin_3.position = CGPoint(x: 160, y: 0)
        spin_3.zPosition = 1
        self.addChild(spin_3)
        //12CDD4 12CDD4
        
        // orange background
        let bg_org = SKShapeNode(rectOf: CGSize(width: 550, height: 360))
        bg_org.zPosition = -2
        bg_org.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        bg_org.position = CGPoint(x: 0, y: 0)
        self.addChild(bg_org)
        
        // lite color column rgba(249, 252, 247, 1)
        let bg_lc1 = SKShapeNode(rectOf: CGSize(width: 150, height: 266))
        bg_lc1.zPosition = -1
        bg_lc1.fillColor = UIColor(red: 18, green: 205, blue: 212, alpha: 0.685)
        bg_lc1.position = CGPoint(x: -160, y: 0)
        self.addChild(bg_lc1)
        
        let bg_lc2 = SKShapeNode(rectOf: CGSize(width: 150, height: 266))
        bg_lc2.zPosition = -1
        bg_lc2.fillColor = UIColor(red: 18, green: 205, blue: 212, alpha: 0.685)
        bg_lc2.position = CGPoint(x: 0, y: 0)
        self.addChild(bg_lc2)
        
        let bg_lc3 = SKShapeNode(rectOf: CGSize(width: 150, height: 266))
        bg_lc3.zPosition = -1
        bg_lc3.fillColor = UIColor(red: 18, green: 205, blue: 212, alpha: 0.685)
        bg_lc3.position = CGPoint(x: 160, y: 0)
        self.addChild(bg_lc3)
        
        // Bet 10 label
        betLabel_10 = SKLabelNode(text: "10")
        betLabel_10.position = CGPoint(x: -195, y: -250)
        betLabel_10.zPosition = 1
        betLabel_10.fontName = labelFontName
        betLabel_10.fontSize = CGFloat(labelFontSize)
        betLabel_10.fontColor = UIColor.black
        self.addChild(betLabel_10)
        
        let betBox1 = SKShapeNode(rect: CGRect(x: -222, y: -260, width: 60, height: 40), cornerRadius: 20)
        betBox1.fillColor = UIColor.yellow
        self.addChild(betBox1)
        
        // Bet 20 label
        betLabel_20 = SKLabelNode(text: "20")
        betLabel_20.position = CGPoint(x: -61, y: -250)
        betLabel_20.zPosition = 1
        betLabel_20.fontName = labelFontName
        betLabel_20.fontSize = CGFloat(labelFontSize)
        betLabel_20.fontColor = UIColor.black
        self.addChild(betLabel_20)
        
        let betBox2 = SKShapeNode(rect: CGRect(x: -87, y: -260, width: 60, height: 40), cornerRadius: 20)
        betBox2.fillColor = UIColor.yellow
        self.addChild(betBox2)
        
        // Bet 50 label
        betLabel_50 = SKLabelNode(text: "50")
        betLabel_50.position = CGPoint(x: 68, y: -250)
        betLabel_50.zPosition = 1
        betLabel_50.fontName = labelFontName
        betLabel_50.fontSize = CGFloat(labelFontSize)
        betLabel_50.fontColor = UIColor.black
        self.addChild(betLabel_50)
        
        let betBox3 = SKShapeNode(rect: CGRect(x: 42, y: -260, width: 60, height: 40), cornerRadius: 20)
        betBox3.fillColor = UIColor.yellow
        self.addChild(betBox3)
        
        // Bet 100 label
        betLabel_100 = SKLabelNode(text: "100")
        betLabel_100.position = CGPoint(x: 205, y: -250)
        betLabel_100.zPosition = 1
        betLabel_100.fontName = labelFontName
        betLabel_100.fontSize = CGFloat(labelFontSize)
        betLabel_100.fontColor = UIColor.black
        self.addChild(betLabel_100)
        
        let betBox4 = SKShapeNode(rect: CGRect(x: 176, y: -260, width: 60, height: 40), cornerRadius: 20)
        betBox4.fillColor = UIColor.yellow
        self.addChild(betBox4)
        
        // BET label display
        currentBetNumber = SKLabelNode(text: "0")
        currentBetNumber.position = CGPoint(x: 45, y: -320)
        currentBetNumber.zPosition = 1
        currentBetNumber.fontName = numberFontName
        currentBetNumber.fontSize = CGFloat(numberFontSize)
        currentBetNumber.fontColor = UIColor.white
        self.addChild(currentBetNumber)
        
        // Current bet display
        currentBetLabel = SKLabelNode(text: "BET :")
        currentBetLabel.position = CGPoint(x: -50, y: -320)
        currentBetLabel.zPosition = 1
        currentBetLabel.fontName = labelFontName
        currentBetLabel.fontSize = 29
        currentBetLabel.fontColor = UIColor.systemOrange
        self.addChild(currentBetLabel)
        
        let currentBet = SKShapeNode(rect: CGRect(x: 0, y: -330, width: 90, height: 40), cornerRadius: 10)
        currentBet.fillColor = UIColor.gray
        self.addChild(currentBet)
        
        //  Winning Price label
        winnerPaidLabel = SKLabelNode(text: "Winning Amount")
        winnerPaidLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 370, y: self.frame.size.height * 0.5 - 340)
        winnerPaidLabel.zPosition = 1
        winnerPaidLabel.fontName = labelFontName
        winnerPaidLabel.fontSize = CGFloat(labelFontSize)
        winnerPaidLabel.fontColor = UIColor.white
        self.addChild(winnerPaidLabel)
        
        // Winning price
        winnerPaidNumber = SKLabelNode(text: "$ 0")
        winnerPaidNumber.position = CGPoint(x: self.frame.size.width * 0.5 - 370, y: self.frame.size.height * 0.5 - 380)
        winnerPaidNumber.zPosition = 1
        winnerPaidNumber.fontName = numberFontName
        winnerPaidNumber.fontSize = CGFloat(numberFontSize)
        winnerPaidNumber.fontColor = UIColor.white
        self.addChild(winnerPaidNumber)
        
        // Winning display
        winPad = SKLabelNode(text: "Result!")
        winPad.position = CGPoint(x: -2.202, y: 220)
        winPad.zPosition = 1
        winPad.fontName = labelFontName
        winPad.fontSize = CGFloat(labelFontSize)
        winPad.fontColor = UIColor.orange
        self.addChild(winPad)
        
        let winPadBox = SKShapeNode(rect: CGRect(x: -140, y: 200, width: 279.999, height: 58.725), cornerRadius: 10)
        winPadBox.fillColor = UIColor.white
        self.addChild(winPadBox)
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if betLabel_10.contains(location){
                if (credit < 10) {
                    showToast(message: "You don't have enough money.", font: UIFont(name: "AvenirNextCondensed-Heavy", size: 30)!)
                    spinButton.texture = SKTexture(imageNamed: "spin2");
                }else {
                    bet = 10
                }
            }
            if betLabel_20.contains(location){
                if (credit < 20) {
                    showToast(message: "You don't have enough money.", font: UIFont(name: "AvenirNextCondensed-Heavy", size: 30)!)
                    spinButton.texture = SKTexture(imageNamed: "spin2");
                } else {
                    bet = 20
                }
            }
            if betLabel_50.contains(location){
                if (credit < 50) {
                    showToast(message: "You don't have enough money.", font: UIFont(name: "AvenirNextCondensed-Heavy", size: 30)!)
                    spinButton.texture = SKTexture(imageNamed: "spin2");
                } else {
                    bet = 50
                }
            }
            if betLabel_100.contains(location){
                if (credit < 100) {
                    showToast(message: "You don't have enough money.", font: UIFont(name: "AvenirNextCondensed-Heavy", size: 30)!)
                    spinButton.texture = SKTexture(imageNamed: "spin2");
                } else {
                    bet = 100
                }
            }
            
            //Spin button touch action
            if spinButton.contains(location)
            {
                if((credit == 0) || (credit < bet))
                {
                    showToast(message: "You do not have enough money...!", font: UIFont(name: "AvenirNextCondensed-Heavy", size: 15)!)
                    bet = 0;
                    spinButton.texture = SKTexture(imageNamed: "spin2");
                    return;
                }
                if(bet == 0)
                {
                    showToast(message: "First enter the bet amount...!", font: UIFont(name: "AvenirNextCondensed-Heavy", size: 15)!)
                    return;
                }
                
                wheelAction = true
                
                let count: SKAction = SKAction.wait(forDuration: 0.3)
                let spinWheel1: SKAction = SKAction.run
                {
                    self.spinWheel(wheelNo: 1)
                }
                
                let spinWheel2: SKAction = SKAction.run
                {
                    self.spinWheel(wheelNo: 2)
                }
                
                let spinWheel3: SKAction = SKAction.run
                {
                    self.spinWheel(wheelNo: 3)
                }
                
                let wheelValueTest: SKAction = SKAction.run
                {
                    self.valueTest()
                    self.clearState()
                }
                self.run(SKAction.sequence([
                    spinWheel1,
                    count,
                    spinWheel2,
                    count,
                    spinWheel3,
                    count,
                    wheelValueTest
                ]))
            }
        }
            
            func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
            {
                for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
            }
            
            func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
                for t in touches { self.touchUp(atPoint: t.location(in: self)) }
            }
            
            func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
                for t in touches { self.touchUp(atPoint: t.location(in: self)) }
            }
            
            
            func update(_ currentTime: TimeInterval) {
                
            }
            
            
        }
    
    func spinWheel(wheelNo: Int) -> Void
    {
        scene?.run(SKAction.playSoundFileNamed("spin", waitForCompletion: false))
        
        let randomNumber: UInt32 = arc4random_uniform(UInt32(100))
        var wheelPick: String = "strawberry"
        
        switch randomNumber
        {
            // case 1 - 55% probability
            case 0..<55:
                wheelPick = "blank"
                blank += 1
                break
            
            //case 2 - 15% probability
            case 55..<70:
                wheelPick = "grape"
                grape += 1
                break
            
            //case 3 - 30% probability
            case 70..<90:
                wheelPick = "cherry"
                cherry += 1
                break
            
            //case 4 - probability
            case 90..<94:
                wheelPick = "bell"
                bell += 1
                break
            
            //case 5 - 3% probability
            case 94..<97:
                wheelPick = "strawberry"
                strawberry += 1
                break
            
            //case 6 - 2% probability
            case 97..<99:
                wheelPick = "coin"
                coin += 1
                break
            
            //case 7 - 1% probability
            case 99..<100:
                wheelPick = "seven"
                seven += 1
                break
            
            default:
                break
        }
        
        if(wheelNo == 1)
        {
            currentWheelValue1 = wheelPick
            spin_1.texture = SKTexture(imageNamed: wheelPick)
        }
        else if(wheelNo == 2)
        {
            currentWheelValue2 = wheelPick
            spin_2.texture = SKTexture(imageNamed: wheelPick)
        }
        else if(wheelNo == 3)
        {
            currentWheelValue3 = wheelPick
            spin_3.texture = SKTexture(imageNamed: wheelPick)
        }
    }
    
    func clearState()
    {
        blank = 0
        seven = 0
        bell = 0
        cherry = 0
        coin = 0
        grape = 0
        strawberry = 0
    }
    
    func showToast(message : String, font: UIFont)
    {
        messageBox(messageTitle: message, messageAlert: "Important", messageBoxStyle: UIAlertController.Style.alert, alertActionStyle: UIAlertAction.Style.default, completionHandler: {});
    }
    
    func messageBox(messageTitle: String, messageAlert: String, messageBoxStyle: UIAlertController.Style, alertActionStyle: UIAlertAction.Style, completionHandler: @escaping () -> Void)
    {
        let alert = UIAlertController(title: messageTitle, message: messageAlert, preferredStyle: messageBoxStyle)
        
        let okAction = UIAlertAction(title: "Ok", style: alertActionStyle) { _ in
            completionHandler() // This will only get called after okay is tapped in the alert
        }
        
        alert.addAction(okAction)
        self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
        //            present(alert, animated: true, completion: nil)
    }
    
    func valueTest()
    {
        //If win
        if(blank < 1)
        {
            winPad.text = "Winner!"
            if(bell == 3)
            {
                winnerPaid = bet * 10;
            }
            else if(cherry == 3)
            {
                winnerPaid = bet * 20;
            }
            else if(grape == 3)
            {
                winnerPaid = bet * 30;
            }
            else if(strawberry == 3)
            {
                winnerPaid = bet * 40;
            }
            else if(coin == 3)
            {
                winnerPaid = bet * 50;
            }
            else if(seven == 3)
            {
                winnerPaid = bet * 100;
                winPad.text = "$$$ JACKPOT $$$ \(winnerPaid)"
            }
            else if(bell == 2)
            {
                winnerPaid = bet * 2;
            }
            else if(cherry == 2)
            {
                winnerPaid = bet * 2;
            }
            else if(grape == 2)
            {
                winnerPaid = bet * 2;
            }
            else if(strawberry == 2)
            {
                winnerPaid = bet * 2;
            }
            else if(coin == 2)
            {
                winnerPaid = bet * 3;
            }
            else if(seven == 2)
            {
                winnerPaid = bet * 20;
            }
            else if(seven == 1)
            {
                winnerPaid = bet * 5;
            }
            credit += winnerPaid
        }
        //loose
        else
        {
            winPad.text = "Looser...!!"
            credit -= bet
            winnerPaid = 0
        }
        
        if(credit < bet)
        {
            bet = 0;
        }
    }
}
