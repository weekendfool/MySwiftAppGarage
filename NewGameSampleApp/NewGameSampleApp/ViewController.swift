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

class ViewController: UIViewController, ARSCNViewDelegate, UIPopoverControllerDelegate {

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
            // popupの実行
//            popUp.popuUp(view: view, targetViiew: self)
            playerCount = beforeChoseAgentbutton(count: count)
            normalAgentLabel.text = String(playerInfo!.0)
            glayAgentLabel.text = String(playerInfo!.1)
            
            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
            print(judgementBetrayer.betrayerDic)
            switch count {
            case 17:
                finish()
            default:
                print("out")
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
            return .none
        }
    
    var fieldPoint: SCNVector3?
    var betrayerFlag: Bool?
    var playerCount: Int?
    var betrayerDic: [String: Int] = ["playerCount": 0, "buttonNumber": 0]
    var playerInfo: (Int, Int)?
    var winLabelString: Int?
//    var buttonDic: [Int: UIButton] = [1: oneButton, 2: twoButton, 3: oneButton, 4: oneButton, 5: oneButton, 6: oneButton, 7: oneButton, 8: oneButton, 9: oneButton, 10: oneButton, 11: oneButton, 12: oneButton, 13: oneButton, 14: oneButton, 15: oneButton, 16: oneButton]
    
    // 各インスタンスの作成
    var player = Player()
    var saveColor = SaveColor()
    let makeField = MakeField()
    let setAR = SetAR()
    let makePawn = Pawn()
    let deleteAR = DeleteAR()
    let judmentWiner = JudmentWiner()
    var judgementBetrayer = JudgementBetrayer()
    let buttonProcessing = ButtonProcessing()
    let popUp = PopUP()
    
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
    func numberButtonAction(buttonNumber: Int, count: Int, uiButton: UIButton) {
        
        // ポーンの作成
        makePawn.makePawn(playerColor: playerCount!, fieldNumber: buttonNumber, fieldPoint: fieldPoint!, targetSceneView: sceneView)
        //　色の保存
        saveColor.saveColor(inputColor: playerCount!, placeNumber: buttonNumber)
        // buttonの無効化
        buttonProcessing.buttonProcessing(buttonNumber: uiButton, plyaerColor: playerCount!)
        // 裏切っていた場合の記録
        betrayerDic["playerCount"] = playerCount!
        betrayerDic["buttonNumber"] = buttonNumber
        if betrayerFlag! {
            judgementBetrayer.recordBetrayer(choosePlayerNumber: playerCount!, choosePlaceNumber: buttonNumber)
        }
        
        
    
    }
    
    func beforeChoseAgentbutton(count: Int) -> Int {
        // プレイヤーが青か赤かの判定
        var playerCount = player.makePlayer(count: count)
        // ボタンの作成
        buttonProcessing.buttonPlayer(buttonNumberRight: normalAgentButton, buttonNumberLeft: glayAgentButton, plyaerColor: playerCount, playerInfo: playerInfo!)
        
        return playerCount
    }
    
    func finish() {
        // 色変え
        for num in 1...2 {
            switch (judgementBetrayer.betrayerDic[num]) {
            case 1:
                if num == 1 {
                    oneButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    oneButton.backgroundColor = UIColor.red
                }
            case 2:
                if num == 1 {
                    twoButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    twoButton.backgroundColor = UIColor.red
                }
            case 3:
                if num == 1 {
                    threeButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    threeButton.backgroundColor = UIColor.red
                }
            case 4:
                if num == 1 {
                    fourButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    fourButton.backgroundColor = UIColor.red
                }
            case 5:
                if num == 1 {
                    fiveButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    fiveButton.backgroundColor = UIColor.red
                }
            case 6:
                if num == 1 {
                    sixButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    sixButton.backgroundColor = UIColor.red
                }
            case 7:
                if num == 1 {
                    sevenButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    sevenButton.backgroundColor = UIColor.red
                }
            case 8:
                if num == 1 {
                    eightButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    eightButton.backgroundColor = UIColor.red
                }
            case 9:
                if num == 1 {
                    nineButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    nineButton.backgroundColor = UIColor.red
                }
            case 10:
                if num == 1 {
                    tenButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    tenButton.backgroundColor = UIColor.red
                }
            case 11:
                if num == 1 {
                    elevenButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    elevenButton.backgroundColor = UIColor.red
                }
            case 12:
                if num == 1 {
                    twelveButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    twelveButton.backgroundColor = UIColor.red
                }
            case 13:
                if num == 1 {
                    thirteenButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    thirteenButton.backgroundColor = UIColor.red
                }
            case 14:
                if num == 1 {
                    fourteenButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    fourteenButton.backgroundColor = UIColor.red
                }
            case 15:
                if num == 1 {
                    fifteenButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    fifteenButton.backgroundColor = UIColor.red
                }
            case 16:
                if num == 1 {
                    sixteenButton.backgroundColor = UIColor.blue
                } else if num == 2 {
                    sixteenButton.backgroundColor = UIColor.red
                }
                
            default:
                print("judge error")
        }
        
        }
        
        // 裏切り者の処理
//        judgementBetrayer.judgementBetrayer(beforeColorDic: <#T##[Int : Int]#>)
        winLabelString = judmentWiner.judgmentWiner(afterColorDic: saveColor.colorDic)
        switch winLabelString {
        case 1:
            winLabel.text = "\(winLabelString!)Pの勝利"
        case 2:
            winLabel.text = "\(winLabelString!)Pの勝利"
        case 3:
            winLabel.text = "引き分け"
        default:
            print("error")
        }
        
    }

    
    @IBAction func oneButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 1, count: count, uiButton: oneButton)
    }
    @IBAction func twoButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 2, count: count, uiButton: twoButton)
    }
    @IBAction func threeButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 3, count: count, uiButton: threeButton)
    }
    @IBAction func fourButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 4, count: count, uiButton: fourButton)
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 5, count: count, uiButton: fiveButton)
    }
    @IBAction func sixButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 6, count: count, uiButton: sixButton)
    }
    @IBAction func sevenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 7, count: count, uiButton: sevenButton)
    }
    @IBAction func eightButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 8, count: count, uiButton: eightButton)
    }
    @IBAction func nineButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 9, count: count, uiButton: nineButton)
    }
    @IBAction func tenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 10, count: count, uiButton: tenButton)
    }
    @IBAction func elevenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 11, count: count, uiButton: elevenButton)
    }
    @IBAction func tewlveButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 12, count: count, uiButton: twelveButton)
    }
    @IBAction func thirteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 13, count: count, uiButton: thirteenButton)
    }
    @IBAction func fourteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 14, count: count, uiButton: fourteenButton)
    }
    @IBAction func fifteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 15, count: count, uiButton: fifteenButton)
    }
    @IBAction func sixteenButtonPressed(_ sender: Any) {
        numberButtonAction(buttonNumber: 16, count: count, uiButton: sixteenButton)
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
