//
//  ViewController.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/11.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var count = 0
    var fieldPoint: SCNVector3?
    var gameFlag = 0 {
        didSet {
            switch gameFlag {
            case 1:
                mainLabel.changeLabelString(messageString: "1P Win Finish" )
            case 2:
                mainLabel.changeLabelString(messageString: "2P Win Finish" )
            case 3:
                mainLabel.changeLabelString(messageString: "Draw Finish" )
            default:
                mainLabel.changeLabelString(messageString: "Please Tap Reset Button")
            }
        }
    }
    
    // 各インスタンスの設定
    // modelのインスタンス
    let player = Player()
    let getScreenSize = GetScreenSize()
    let saveColor = SaveColor()
    let setButton = SetButton()
    let makeField = MakeField()
    let settingAR = SettingAR()
    let judgmentWiner = JudgmentWiner()
    let pawn = Pawn()
    let deleteAR = DeleteAR()
    // viewのインスタンス
    let makeButton = MakeButton()
    let mainLabel = MainLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
    
    // 初期設定
    func setUp() {
        // viewの格納
        let mainView = view
        // スクリーンサイズの取得
        let myScreenSize = getScreenSize.setScreenSize()
        
        // ボタンの作成
        // ボタン用の配列作成
        let namberButtonArray = makeButton.setNumverButtonArray()
        let gameButtonArray = makeButton.setGameButtonArray()
        // ボタンの描画
        makeButton.makeButton(screenWidth: myScreenSize.0, screenHeight: myScreenSize.1, buttonArray: namberButtonArray, targetView: mainView!)
        
        // ラベルの作成
        mainLabel.makeLabel(screenWidth: myScreenSize.0, screenHeight: myScreenSize.1, targetView: mainView!)
        mainLabel.setFirstString()
        
        // arの設定
        settingAR.setAR(targetViewController: self, targetSceneView: sceneView)
       
        
    }
    
    // buttonアクションの設定
    func buttonAction(placeNumber: Int) {
        
        // プレイヤーの判定
        let playerInfo = player.player(count: count)
        let playerName = playerInfo.0
        let playerColor = playerInfo.1
        
        // buttonの色変え
        // ボタン用の配列作成
        let namberButtonArray = makeButton.setNumverButtonArray()
        makeButton.changeCoulerButton(buttonNumber: placeNumber, player: playerColor, buttonArray: namberButtonArray)
        
        // pawnの表示
        if let fieldPoint = fieldPoint {
            pawn.makePawn(playerColor: playerColor, fieldNumber: placeNumber, fieldPoint: fieldPoint)
        }
        
        
        //色の保存
        let colorDic = saveColor.saveColor(InputColor: playerColor, placeNumber: placeNumber)
        //　勝敗の判定
        gameFlag = judgmentWiner.judgmentWiner(colorDic: colorDic, count: count)
        
        // countのカウントアップ
        count += 1
        // ラベルに反映
        // 次のplayerの表示
        let nextPlayer = player.player(count: count)
        let nextPlayerName = nextPlayer.0
//        let nextPlayerColor = playerInfo.1
        mainLabel.changeLabelString(messageString: nextPlayerName)
    }
    
    // MARK: - ボタン押した時の処理
    @IBAction func oneButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 1)
    }
    
    @IBAction func tewButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 2)
    }
    
    @IBAction func threeButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 3)
    }
    
    @IBAction func fourButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 4)
    }
    
    @IBAction func fiveButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 5)
    }
    
    @IBAction func sixButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 6)
    }
    
    @IBAction func sevenButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 7)
    }
    @IBAction func eightButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 8)
    }
    
    @IBAction func nineButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 9)
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        // フィールドの設定をする
        fieldPoint = makeField.makeField(targetSceneView: sceneView)
        
        // 次のplayerの表示
        let nextPlayer = player.player(count: count)
        let nextPlayerName = nextPlayer.0
        // ラベルの変更
        mainLabel.changeLabelString(messageString: nextPlayerName)
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        // オブジェクトの消去
//        deleteAR.deleteAR(fieldNode: <#T##SCNNode#>, pawnNode: <#T##SCNNode#>)
        // buttonの有効化、無効化
        let namberButtonArray = makeButton.setNumverButtonArray()
        makeButton.resetButton(buttonArray: namberButtonArray)
    }
}
