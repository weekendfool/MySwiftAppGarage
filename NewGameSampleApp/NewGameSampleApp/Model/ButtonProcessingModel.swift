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
    
        
        
        
    }
    
    func buttonPlayer(buttonNumberRight: UIButton, buttonNumberLeft: UIButton, plyaerColor: Int) {
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
        case 2:
            // イメージの設定
            agentNormalImage = UIImage(named: agentImage[4])
            agentBetrayerImage = UIImage(named:  agentImage[3])
            
            //ボタンに画像を貼りつける
            buttonNumberRight.setImage(agentNormalImage, for: .normal)
            buttonNumberLeft.setImage(agentBetrayerImage, for: .normal)
        default:
            print("error Button")
        }
    }
}
