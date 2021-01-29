//
//  ViewController.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/22.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var elevenButton: UIButton!
    @IBOutlet weak var twelveButton: UIButton!
    @IBOutlet weak var thirteenButton: UIButton!
    @IBOutlet weak var fourteenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var sixteenButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var normalAgentButton: UIButton!
    @IBOutlet weak var normalAgentLabel: UILabel!
    @IBOutlet weak var glayAgentButton: UIButton!
    @IBOutlet weak var glayAgentLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    var count = 0 {
        didSet {
            playerCount = beforeChoseAgentbutton(count: count)
            normalAgentLabel.text = String(playerInfo!.0)
            glayAgentLabel.text = String(playerInfo!.1)
            
            switch count {
            case 17:
                finish()
            default:
                print("out")
            }
        }
    }
    var fieldPoint: SCNVector3?
    var betrayerFlag: Bool?
    var playerCount: Int?
    var betrayerDic: [String: Int] = ["playerCount": 0, "buttonNumber": 0]
    var playerInfo: (Int, Int)?
    var winLabelString: Int?
    
    // 各インスタンスの作成
    var player = Player()
    var saveColor = SaveColor()
    let makeField = MakeField()
    let setAR = SetAR()
    let makePawn = Pawn()
    let deleteAR = DeleteAR()
    let judmentWiner = JudmentWiner()
    let judgementBetrayer = JudgementBetrayer()
    let buttonProcessing = ButtonProcessing()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAR.setAR(targetViewController: self, targetSceneView: sceneView)
        startButton.isEnabled = true
        startButton.isHidden = false
        betrayerFlag = false
        playerInfo = player.playerInfo(playerColor: 0, selectAgent: 0)
        
    }
   
    // MARK: - ARSCNViewDelegate
    
    @IBAction func startButtonPressed(_ sender: Any) {
        // フィールドを展開する
        fieldPoint = makeField.makeField(targetSceneView: sceneView)
        // ボタンを非表示
        startButton.isEnabled = false
        startButton.isHidden = true
        
        count += 1
    }
    
    // ボタンの動作を記述
    func numberButtonAction(buttonNumber: Int, count: Int) {
        
        // ポーンの作成
        makePawn.makePawn(playerColor: playerCount!, fieldNumber: buttonNumber, fieldPoint: fieldPoint!, targetSceneView: sceneView)
        //　色の保存
        saveColor.saveColor(inputColor: playerCount!, placeNumber: buttonNumber)
        // 裏切っていた場合の記録
        betrayerDic["playerCount"] = playerCount!
        betrayerDic["buttonNumber"] = buttonNumber
    }
    
    func beforeChoseAgentbutton(count: Int) -> Int {
        // プレイヤーが青か赤かの判定
        var playerCount = player.makePlayer(count: count)
        // ボタンの作成
        buttonProcessing.buttonPlayer(buttonNumberRight: normalAgentButton, buttonNumberLeft: glayAgentButton, plyaerColor: playerCount)
        
        return playerCount
    }
    
    func finish() {
        // 裏切り者の処理
//        judgementBetrayer.judgementBetrayer(beforeColorDic: <#T##[Int : Int]#>)
        winLabelString = judmentWiner.judgmentWiner(afterColorDic: saveColor.colorDic)
        switch winLabelString {
        case 1:
            winLabel.text = "\(winLabelString)Pの勝利"
        case 2:
            winLabel.text = "\(winLabelString)Pの勝利"
        case 3:
            winLabel.text = "引き分け"
        default:
            print("error")
        }
        
    }

    
    @IBAction func oneButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 1, count: count)
    }
    @IBAction func twoButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 2, count: count)
    }
    @IBAction func threeButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 3, count: count)
    }
    @IBAction func fourButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 4, count: count)
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 5, count: count)
    }
    @IBAction func sixButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 6, count: count)
    }
    @IBAction func sevenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 7, count: count)
    }
    @IBAction func eightButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 8, count: count)
    }
    @IBAction func nineButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 9, count: count)
    }
    @IBAction func tenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 10, count: count)
    }
    @IBAction func elevenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 11, count: count)
    }
    @IBAction func tewlveButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 12, count: count)
    }
    @IBAction func thirteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 13, count: count)
    }
    @IBAction func fourteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 14, count: count)
    }
    @IBAction func fifteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 15, count: count)
    }
    @IBAction func sixteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 16, count: count)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        var saveColorFunc = saveColor.saveColor(inputColor: betrayerDic["playerCount"]!, placeNumber: betrayerDic["buttonNumber"]!)
        //裏切った場合の処理
        switch betrayerFlag {
        case true:
            print("true")
            var alertController = judgementBetrayer.popUp(saveColor:saveColorFunc)
            // popupの発動
            present(alertController, animated: true, completion: nil)
        case false:
            print("false")
        default:
            print("error")
        }
        
        // 裏切りフラグのリセット
        betrayerFlag = false
        count += 1
    }
    @IBAction func normalAgentButtonPressed(_ sender: Any) {
        
        switch betrayerFlag {
        case true:
            print("true")
            playerInfo = player.playerInfo(playerColor: playerCount!, selectAgent: 2)
            
        case false:
            print("false")
            playerInfo = player.playerInfo(playerColor: playerCount!, selectAgent: 1)
        default:
            print("error")
        }
    }
    
    @IBAction func glaynormalAgentButtonPressed(_ sender: Any) {
        betrayerFlag = true
        
        switch betrayerFlag {
        case true:
            print("true")
            playerInfo = player.playerInfo(playerColor: playerCount!, selectAgent: 2)
        case false:
            print("false")
            playerInfo = player.playerInfo(playerColor: playerCount!, selectAgent: 1)
        default:
            print("error")
        }
        
    }
    
   
}
