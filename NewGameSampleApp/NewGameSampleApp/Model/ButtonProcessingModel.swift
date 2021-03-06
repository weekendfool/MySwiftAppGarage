//
//  ButtonProcessingModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/27.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

struct ButtonProcessing {
    
    // buttonの動作を記述
    func buttonProcessing(buttonNumber: UIButton, plyaerColor: Int) {
        
        // ボタンの色を変える
        // ボタンの無効にする
        switch plyaerColor {
        case 1:
            buttonNumber.backgroundColor = UIColor.red
            
            buttonNumber.isEnabled = false
        case 2:
            buttonNumber.backgroundColor = UIColor.blue
            buttonNumber.isEnabled = false
        default:
            print("error Button")
        }
    
        buttonNumber.tintColor = UIColor.black
        
        
    }
    
    func buttonPlayer(buttonNumberRight: UIButton, buttonNumberLeft: UIButton, plyaerColor: Int, playerInfo: (Int, Int)) {
        var agentImage: [String] = ["AgentBKGY", "AgentBKN", "AgentWTGY", "AgentWTN"]
        var agentNormalImage: UIImage?
        var agentBetrayerImage: UIImage?
        
        switch plyaerColor {
        case 1:
            // イメージの設定
            agentNormalImage = UIImage(named: agentImage[1])
            agentBetrayerImage = UIImage(named:  agentImage[0])
            
            //ボタンに画像を貼りつける
            buttonNumberRight.setImage(agentNormalImage, for: .normal)
            buttonNumberLeft.setImage(agentBetrayerImage, for: .normal)
            
//            // 残機を使い切った場合押せなくする
//            if playerInfo.0 == 0 {
//                buttonNumberRight.isEnabled = false
//            } else if playerInfo.1 == 0 {
//                buttonNumberLeft.isEnabled = false
//            }
        case 2:
            // イメージの設定
            agentNormalImage = UIImage(named: agentImage[2])
            agentBetrayerImage = UIImage(named:  agentImage[3])
            
            //ボタンに画像を貼りつける
            buttonNumberRight.setImage(agentNormalImage, for: .normal)
            buttonNumberLeft.setImage(agentBetrayerImage, for: .normal)
        default:
            print("error Button")
        }
    }
}
