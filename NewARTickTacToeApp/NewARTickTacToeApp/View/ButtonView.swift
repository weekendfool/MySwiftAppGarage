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
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var tewButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    func setNumverButtonArray() -> [UIButton] {
        // 番号ボタンの配列を作成
        let numberButtonArray: [UIButton] = [oneButton, tewButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        
        return numberButtonArray
    }

    func setGameButtonArray() -> [UIButton] {
        let gameButtonArray: [UIButton] = [startButton, resetButton]
        
        return gameButtonArray
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
                let numberButton = UIButton()
                // スイッチ文で条件分岐
                switch buttonName {
                case oneButton:
                    buttonLabel = "1";
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 8
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().oneButtonAction), for: .touchUpInside)
                case tewButton:
                    buttonLabel = "2"
                    buttonPointX = buttonSizeWidth * 1
                    buttonPointY = buttonSizeHight * 8
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().tewButtonAction), for: .touchUpInside)
                case threeButton:
                    buttonLabel = "3"
                    buttonPointX = buttonSizeWidth * 2
                    buttonPointY = buttonSizeHight * 8
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().threeButtonAction), for: .touchUpInside)
                case fourButton:
                    buttonLabel = "4"
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 7
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().fourButtonAction), for: .touchUpInside)
                case fiveButton:
                    buttonLabel = "5"
                    buttonPointX = buttonSizeWidth * 1
                    buttonPointY = buttonSizeHight * 7
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().fiveButtonAction), for: .touchUpInside)
                case sixButton:
                    buttonLabel = "6"
                    buttonPointX = buttonSizeWidth * 2
                    buttonPointY = buttonSizeHight * 7
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().sixButtonAction), for: .touchUpInside)
                case sevenButton:
                    buttonLabel = "7"
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 6
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().sevenButtonAction), for: .touchUpInside)
                case eightButton:
                    buttonLabel = "8"
                    buttonPointX = buttonSizeWidth * 1
                    buttonPointY = buttonSizeHight * 6
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().eightButtonAction), for: .touchUpInside)
                case nineButton:
                    buttonLabel = "9"
                    buttonPointX = buttonSizeWidth * 2
                    buttonPointY = buttonSizeHight * 6
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().nineButtonAction), for: .touchUpInside)
                case startButton:
                    buttonLabel = "Start"
                    buttonPointX = buttonSizeWidth * 0
                    buttonPointY = buttonSizeHight * 9
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().startButtonAction), for: .touchUpInside)
                case resetButton:
                    buttonLabel = "Reset"
                    buttonPointX = buttonSizeWidth * 3 / 2
                    buttonPointY = buttonSizeHight * 9
                    numberButton.addTarget(ViewController(), action: #selector(ViewController().resetButtonAction), for: .touchUpInside)
                default:
                    print("NumberButton Make Errror")
                    return
                }
                
                // buttonのラベル作成
                numberButton.setTitle("\(buttonLabel)", for: UIControl.State.normal)
                
                // buttonのフォントサイズを設定
                numberButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
                
                // buttonのサイズを設定
                if buttonLabel == "Start" || buttonLabel == "Reset" { // Start, Resetボタンのサイズ
                    numberButton.frame = CGRect(x: buttonPointX!, y: buttonPointY!, width: buttonSizeWidth * 3 / 2, height:buttonSizeHight)
    //                print("Button 0 & 00")
                } else { // 番号ボタンのサイズ
                    numberButton.frame = CGRect(x: buttonPointX!, y: buttonPointY!, width: buttonSizeWidth, height:buttonSizeHight)
                }
                // buttonの色を設定
                numberButton.backgroundColor = UIColor.gray
                
                // ボタンの枠線を設定
                numberButton.layer.borderColor = UIColor.darkGray.cgColor
                numberButton.layer.borderWidth = 2.0
                numberButton.layer.cornerRadius = 10
                
                // viewにボタンを追加
                targetView.addSubview(numberButton)
            }
        }
    
    // ボタンの色変え
    func changeCoulerButton(buttonNumber: Int, player: Int, buttonArray:[UIButton]) {
        for buttonName in buttonArray {
            if player == 1 {
                //ボタンの色を変える処理
                buttonName.backgroundColor = UIColor.red
            } else if player == 2 {
                //ボタンの色を変える処理
                buttonName.backgroundColor = UIColor.blue
            }
            //ボタンの文字色を変える処理
            buttonName.setTitleColor(UIColor.gray, for: .normal)
            //二回以上選択できなくする処理
            buttonName.isEnabled = false
        }
    }
    
    // リセットボタンが押された時の書道
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
