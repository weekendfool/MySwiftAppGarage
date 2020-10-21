//
//  SetButtonModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit


class SetButton {
    
    // ゲーム開始処理
    func gameStartedButtonMode(gameStartFlag: Int, gameButtonArray:[UIButton]) {
        let startButton = gameButtonArray[0]
        let resetButton = gameButtonArray[1]
        
        if gameStartFlag == 0 { // ゲーム開始時
            startButton.isEnabled = false
            resetButton.isEnabled = true
        } else if gameStartFlag == 1 { // ゲーム中
            startButton.isEnabled = true
            resetButton.isEnabled = false
        } else if gameStartFlag == 2 { // 勝敗決定時
            startButton.isEnabled = true
            resetButton.isEnabled = false
        }
        
        
    }
    
    // 数字ボタンのモード決定処理
    func buttonModeChange(gameStartFlag: Int, numberButtonArray:[UIButton]) {
        if gameStartFlag == 0 {
            // 数字ボタンの無効化処理
            for buttonName in numberButtonArray {
                buttonName.isEnabled = false
            }
        } else if gameStartFlag == 1 {
            // 数字ボタンの有効化処理
            for buttonName in numberButtonArray {
                buttonName.isEnabled = true
            }
        } else if gameStartFlag == 2 {
            // 数字ボタンの無効化処理
            for buttonName in numberButtonArray {
                buttonName.isEnabled = false
            }
        }
    }
    
}
