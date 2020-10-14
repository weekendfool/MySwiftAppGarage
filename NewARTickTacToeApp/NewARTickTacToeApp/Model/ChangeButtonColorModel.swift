//
//  ChangeButtonColorModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

class ChangeButtonColor {
    
    // ボタンの色変え
    func changeCouler(number: Int, player: Int) {
        var place:UIButton?
        //どのボタンが押されたかの条件分岐
        switch number {
        case 1:
            place = number1Button
        case 2:
            place = number2Button
        case 3:
            place = number3Button
        case 4:
            place = number4Button
        case 5:
            place = number5Button
        case 6:
            place = number6Button
        case 7:
            place = number7Button
        case 8:
            place = number8Button
        case 9:
            place = number9Button
        default:
            return
        }
        
        if player == 1 {
            //ボタンの色を変える処理
            place?.backgroundColor = UIColor.red
            //ボタンの文字色を変える処理
            place?.setTitleColor(UIColor.gray, for: .normal)
            //色を塗ったことを記録
            colorDic[number] = 1
        } else if player == 2 {
            //ボタンの色を変える処理
            place?.backgroundColor = UIColor.blue
            //ボタンの文字色を変える処理
            place?.setTitleColor(UIColor.gray, for: .normal)
            //色を塗ったことを記録
            colorDic[number] = 2
        }
        //二回以上選択できなくする処理
        place?.isEnabled = false
    }
}
