//
//  LabelView.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

class MainLabel {
    
    var mainLabel = UILabel()
    
    // ラベル生成
    func makeLabel(screenWidth:CGFloat, screenHeight:CGFloat, targetView:UIView) {
        // ラベルの位置決定
        mainLabel.frame = CGRect(x:0, y: 0, width: screenWidth, height: screenHeight / 12)
        // ラベルの色決定
        mainLabel.textColor = UIColor.gray
        mainLabel.backgroundColor = UIColor.black
        // ラベルの文字サイズを設定
        mainLabel.font = UIFont.systemFont(ofSize: 30)
        // ラベルの位置決定
        mainLabel.textAlignment = NSTextAlignment.center
        // viewに追加
        targetView.addSubview(mainLabel)
    }
    
    // ラベルの初期化処理
    func setFirstString() {
        // ラベルの初期化
        mainLabel.text = "ARTickTacToe"
    }
    
    // ラベルの表示処理
    func changeLabelString(messageString:String) {
        // ラベルの表示処理
        mainLabel.text = messageString
    }
    
}

