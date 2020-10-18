//
//  ButtonView.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/11.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit


class MakeButton {
    
    var oneButton = UIButton()
    var tewButton = UIButton()
    var threeButton = UIButton()
    var fourButton = UIButton()
    var fiveButton = UIButton()
    var sixButton = UIButton()
    var sevenButton = UIButton()
    var eightButton = UIButton()
    var nineButton = UIButton()
    var startButton = UIButton()
    var resetButton = UIButton()
    
    @IBOutlet weak var oneButtonOutlet: UIButton!
    @IBOutlet weak var tewButtonOutlet: UIButton!
    @IBOutlet weak var threeButtonOutlet: UIButton!
    @IBOutlet weak var fourButtonOutlet: UIButton!
    @IBOutlet weak var fiveButtonOutlet: UIButton!
    @IBOutlet weak var sixButtonOutlet: UIButton!
    @IBOutlet weak var sevenButtonOutlet: UIButton!
    @IBOutlet weak var eightButtonOutlet: UIButton!
    @IBOutlet weak var nineButtonOutlet: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    
    func setNumverButtonArray() -> [UIButton] {
        // 番号ボタンの配列を作成
        let numberButtonArray: [UIButton] = [oneButton, tewButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        
        return numberButtonArray
    }

    func setGameButtonArray() -> [UIButton] {
        let gameButtonArray: [UIButton] = [startButton, resetButton]
        
        return gameButtonArray
    }
    
    func setNumverButtonOutletArray() -> [UIButton] {
        // 番号ボタンの配列を作成
        let numberButtonOutletArray: [UIButton] = [oneButtonOutlet, tewButtonOutlet, threeButtonOutlet, fourButtonOutlet, fiveButtonOutlet, sixButtonOutlet, sevenButtonOutlet, eightButtonOutlet, nineButtonOutlet]
        
        return numberButtonOutletArray
    }
    
    // ボタンをviewに描写する
    func makeButton(screenWidth:CGFloat, screenHeight:CGFloat, buttonArray:[UIButton], targetView: UIView) {
        
            // for文でボタンを生成する
            for  buttonName in buttonArray {
                // buttonの名前を格納する変数
                var buttonLabel:String?
                // buttonの座標を格納する変数
                var buttonPointX:CGFloat? // x軸
                var buttonPointY:CGFloat? // y軸
                // ボタンのサイズの計算
                let buttonSizeWidth = screenWidth / 3.0 // 幅
                let buttonSizeHight = screenHeight / 12.0 // 高さ
                // buttonのインスタンス作成
//                let numberButton = UIButton()
                // スイッチ文で条件分岐
                switch buttonName {
                case oneButton:
                    buttonLabel = "1";
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 10
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().oneButtonAction), for: .touchUpInside)
                case tewButton:
                    buttonLabel = "2"
                    buttonPointX = buttonSizeWidth * 1
                    buttonPointY = buttonSizeHight * 10
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().tewButtonAction), for: .touchUpInside)
                case threeButton:
                    buttonLabel = "3"
                    buttonPointX = buttonSizeWidth * 2
                    buttonPointY = buttonSizeHight * 10
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().threeButtonAction), for: .touchUpInside)
                case fourButton:
                    buttonLabel = "4"
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 9
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().fourButtonAction), for: .touchUpInside)
                case fiveButton:
                    buttonLabel = "5"
                    buttonPointX = buttonSizeWidth * 1
                    buttonPointY = buttonSizeHight * 9
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().fiveButtonAction), for: .touchUpInside)
                case sixButton:
                    buttonLabel = "6"
                    buttonPointX = buttonSizeWidth * 2
                    buttonPointY = buttonSizeHight * 9
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().sixButtonAction), for: .touchUpInside)
                case sevenButton:
                    buttonLabel = "7"
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 8
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().sevenButtonAction), for: .touchUpInside)
                case eightButton:
                    buttonLabel = "8"
                    buttonPointX = buttonSizeWidth * 1
                    buttonPointY = buttonSizeHight * 8
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().eightButtonAction), for: .touchUpInside)
                case nineButton:
                    buttonLabel = "9"
                    buttonPointX = buttonSizeWidth * 2
                    buttonPointY = buttonSizeHight * 8
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().nineButtonAction), for: .touchUpInside)
                case startButton:
                    buttonLabel = "Start"
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 11
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().startButtonAction), for: .touchUpInside)
                case resetButton:
                    buttonLabel = "Reset"
                    buttonPointX = buttonSizeWidth * 3 / 2
                    buttonPointY = buttonSizeHight * 11
                    buttonName.addTarget(ViewController(), action: #selector(ViewController().resetButtonAction), for: .touchUpInside)
                default:
                    print("NumberButton Make Errror")
                    return
                }
                
                // buttonのラベル作成
                if let buttonLabel = buttonLabel {
                    buttonName.setTitle("\(buttonLabel)", for: UIControl.State.normal)
                    
                    // buttonのサイズを設定
                    if buttonLabel == "Start" || buttonLabel == "Reset" { // Start, Resetボタンのサイズ
                        buttonName.frame = CGRect(x: buttonPointX!, y: buttonPointY!, width: buttonSizeWidth * 3 / 2, height:buttonSizeHight)
                    //                print("Button 0 & 00")
                    } else { // 番号ボタンのサイズ
                        buttonName.frame = CGRect(x: buttonPointX!, y: buttonPointY!, width: buttonSizeWidth, height:buttonSizeHight)
                                }
                }
                
                
                // buttonのフォントサイズを設定
                buttonName.titleLabel?.font = UIFont.systemFont(ofSize: 28)
                
                
                
                // ボタンの枠線を設定
                buttonName.layer.borderColor = UIColor.darkGray.cgColor
                buttonName.layer.borderWidth = 2.0
                buttonName.layer.cornerRadius = 10
                
                print("##########################")
                print("numberButton:\(buttonName)")
                // viewにボタンを追加
                targetView.addSubview(buttonName)
            }
        }
    
    // ボタンの色変え
    func changeCoulerButton(buttonNumber: Int, player: Int, buttonArray:[UIButton], targetView: UIView) {
        let buttonName =  buttonArray[buttonNumber - 1]
        print("buttonName:\(buttonName)")
            if player == 1 {
                //ボタンの色を変える処理
                buttonName.backgroundColor = UIColor.red
            } else if player == 2 {
                //ボタンの色を変える処理
                buttonName.backgroundColor = UIColor.blue
            }
            //ボタンの文字色を変える処理
        buttonName.setTitleColor(UIColor.gray, for: [.normal, .disabled])
            //二回以上選択できなくする処理
            buttonName.isEnabled = false
        
//        targetView.addSubview(buttonName)
        
    }
    
    // リセットボタンが押された時の挙動
    func resetButton(buttonArray:[UIButton]) {
        //for文で全てのボタンの色の初期化する
        for buttanName in buttonArray {
            buttanName.backgroundColor = UIColor.clear
            //ボタンの文字色を変える処理
            buttanName.setTitleColor(UIColor.systemBlue, for: .normal)
            buttanName.isEnabled = true
        }
    }
    
}
