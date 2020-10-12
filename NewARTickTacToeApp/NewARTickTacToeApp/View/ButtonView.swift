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
    
    func makeButton {
        
        //for文で全てのボタンの設定をする
        for num in 1...9 {
            var selectButtton: UIButton?
            //switch文でどのボタンが押されたかの条件分岐
            switch num {
            case 1:
                selectButtton = number1Button
            case 2:
                selectButtton = number2Button
            case 3:
                selectButtton = number3Button
            case 4:
                selectButtton = number4Button
            case 5:
                selectButtton = number5Button
            case 6:
                selectButtton = number6Button
            case 7:
                selectButtton = number7Button
            case 8:
                selectButtton = number8Button
            case 9:
                selectButtton = number9Button
            default:
                return
            }
            if startButtonOn == 0 {
                //buttonの無効化
                selectButtton?.isEnabled = false
            } else if startButtonOn == 1 {
                //buttonの有効化
                selectButtton?.isEnabled = true
            }
    }
}
