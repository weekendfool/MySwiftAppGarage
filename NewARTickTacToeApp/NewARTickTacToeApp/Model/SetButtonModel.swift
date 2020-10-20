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
    func gameStartedButtonMode(gameStartFlag: Bool, gameButtonArray:[UIButton]) {
        let startButton = gameButtonArray[0]
        let resetButton = gameButtonArray[1]
        // ゲーム開始時
        if gameStartFlag {
            startButton.isEnabled = false
            resetButton.isEnabled = true
        } else {
            startButton.isEnabled = true
            resetButton.isEnabled = false
        }
        
        
    }
    
    // 勝負がついた時の処理
    func buttonModeChange(gameStartFlag: Bool, numberButtonArray:[UIButton]) {
        if gameStartFlag  {
            // 数字ボタンの無効化処理
            for buttonName in numberButtonArray {
                buttonName.isEnabled = false
            }
        } else {
            // 数字ボタンの有効化処理
            for buttonName in numberButtonArray {
                buttonName.isEnabled = true
            }
        }
    }
    
}
