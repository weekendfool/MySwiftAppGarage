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
    
    
    // 勝負がついた時の処理
    func buttonModeChange(gameStartFlag: Bool, buttonArray:[UIButton]) {
        if gameStartFlag {
            // 数字ボタンの無効化処理
            for buttonName in buttonArray {
                buttonName.isEnabled = false
            }
        } else {
            // 数字ボタンの有効化処理
            for buttonName in buttonArray {
                buttonName.isEnabled = true
            }
        }
    }
    
}
