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
    // buttonのインスタンス格納用変数
    var numberButtonArray: [UIButton]?
    var gameButtonArray: [UIButton]?
    // 何ターン目かを記録する変数
    var count = 0
    // ARfieldの座標を保存しておく変数
    var fieldPoint: SCNVector3?
    // 勝敗がついているかのフラグ
    var winOrLoseFlag = 0 {
        didSet {
            switch winOrLoseFlag {
            case 1:
                mainLabel.changeLabelString(messageString: "1P Win Finish" )
                gameFinished()
            case 2:
                mainLabel.changeLabelString(messageString: "2P Win Finish" )
                gameFinished()
            case 3:
                mainLabel.changeLabelString(messageString: "Draw Finish" )
                gameFinished()
            default:
                mainLabel.changeLabelString(messageString: "Please Tap Reset Button")
            }
        }
    }
    // ゲームが開始されてるかのフラグ
    var gameStartFlag: Int? {
        didSet {
            if let gameButtonArray = gameButtonArray {
                setButton.gameStartedButtonMode(gameStartFlag: gameStartFlag!, gameButtonArray: gameButtonArray)
            }
        }
    }
    // ARNode格納用変数
    var nodeArray: [SCNNode]?
    
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
        // gameStartFlagの初期化
        gameStartFlag = 0
        
        // ボタンの作成
        // ボタン用の配列作成
        numberButtonArray = makeButton.setNumverButtonArray()
        gameButtonArray = makeButton.setGameButtonArray()
        // ボタンの描画
        // 数字ボタンの追加
        makeButton.makeButton(screenWidth: myScreenSize.0, screenHeight: myScreenSize.1, buttonArray: numberButtonArray!, targetView: mainView!)
        // スタートボタンの追加
        makeButton.makeButton(screenWidth: myScreenSize.0, screenHeight: myScreenSize.1, buttonArray: gameButtonArray!, targetView: mainView!)
        // ボタンの状態の設定
        setButton.gameStartedButtonMode(gameStartFlag: gameStartFlag!, gameButtonArray: gameButtonArray!)
        setButton.buttonModeChange(gameStartFlag: gameStartFlag!, numberButtonArray: numberButtonArray!)
        
        // ラベルの作成
        mainLabel.makeLabel(screenWidth: myScreenSize.0, screenHeight: myScreenSize.1, targetView: mainView!)
        mainLabel.setFirstString()
        
        // arの設定
        settingAR.setAR(targetViewController: self, targetSceneView: sceneView)
        
    }
    
    // buttonアクションの設定
    func buttonAction(placeNumber: Int) {
        // viewの格納
        let mainView = view
        // プレイヤーの判定
        let playerInfo = player.player(count: count)
        let playerName = playerInfo.0
        let playerColor = playerInfo.1
        
        // buttonの色変え
        makeButton.changeCoulerButton(buttonNumber: placeNumber, player: playerColor, buttonArray: numberButtonArray!, targetView: mainView!)
        // pawnの表示
        if let fieldPoint = fieldPoint {
            let newPawnNode = pawn.makePawn(playerColor: playerColor, fieldNumber: placeNumber, fieldPoint: fieldPoint, targetSceneView: sceneView)
            // 新しいPawnNodeを格納
            
            nodeArray!.append(newPawnNode)
        }
        
        // 画面の再描画
        
        //色の保存
        let colorDic = saveColor.saveColor(inputColor: playerColor, placeNumber: placeNumber)
        print("colorDic:\(colorDic)")
        //　勝敗の判定
        winOrLoseFlag = judgmentWiner.judgmentWiner(colorDic: colorDic, count: count)
        
        // 勝敗が決まっていない時
        if winOrLoseFlag == 0 {
            // countのカウントアップ
            count += 1
            // ラベルに反映
            // 次のplayerの表示
            let nextPlayer = player.player(count: count)
            let nextPlayerName = nextPlayer.0
//        let nextPlayerColor = playerInfo.1
            mainLabel.changeLabelString(messageString: nextPlayerName)
        }
        
    }
    
    // 勝敗が決まった時の処理
    func gameFinished() {
        // gameStartFlagのフラグ変更
        gameStartFlag = 2
        // ボタンの固定
        // ボタン用の配列作成
        setButton.buttonModeChange(gameStartFlag: gameStartFlag!, numberButtonArray: numberButtonArray!)
    }
    
    // MARK: - ボタン押した時の処理
    @IBAction func oneButtonAction(_ sender: Any) {
        buttonAction(placeNumber: 1)
        print("nodeArray:\(nodeArray)")
        
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
        print(count)
       
        // フィールドの設定をする
        let fieldInfo = makeField.makeField(targetSceneView: sceneView)
        fieldPoint = fieldInfo.0
        // fieldのノードを格納
        print("fieldInfo:\(fieldInfo.1)")
        nodeArray = [fieldInfo.1]
        
        // gameStartFlagの設定
        gameStartFlag = 1
        count += 1
        
        // ボタンの有効化
        setButton.buttonModeChange(gameStartFlag: gameStartFlag!, numberButtonArray: numberButtonArray!)
        
        // 次のplayerの表示
        let nextPlayer = player.player(count: count)
        let nextPlayerName = nextPlayer.0
        // ラベルの変更
        mainLabel.changeLabelString(messageString: nextPlayerName)
        print("nodeArray:\(nodeArray)")
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        // ゲームフラグの変更
        gameStartFlag = 0
        // カウンターの初期化
        count = 0
        // オブジェクトの消去
        deleteAR.deleteAR(nodeArray: nodeArray!)
        // buttonの有効化、無効化
        makeButton.resetButton(buttonArray: numberButtonArray!)
        
        // ボタンのモード変更
        setButton.buttonModeChange(gameStartFlag: gameStartFlag!, numberButtonArray: numberButtonArray!)
        setButton.gameStartedButtonMode(gameStartFlag: gameStartFlag!, gameButtonArray: gameButtonArray!)
        
        // 色格納用辞書のリセット
        saveColor.resetColorDic()
        
        // label変更
        mainLabel.setFirstString()
    }
}
