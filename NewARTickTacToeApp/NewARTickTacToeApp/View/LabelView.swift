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
    
    @IBOutlet weak var mainLabel: UILabel!
    
    // ラベル生成
    func MakeLabel(screenWidth:CGFloat, screenHeight:CGFloat, targetView:UIView, targetLabelInstance:UILabel) {
        // ラベルの位置決定
        targetLabelInstance.frame = CGRect(x:0, y: 0, width: screenWidth, height: screenHeight / 12)
        // ラベルの色決定
        targetLabelInstance.textColor = UIColor.gray
        targetLabelInstance.backgroundColor = UIColor.black
        // ラベルの文字サイズを設定
        targetLabelInstance.font = UIFont.systemFont(ofSize: 30)
        // ラベルの位置決定
        targetLabelInstance.textAlignment = NSTextAlignment.center
        // viewに追加
        targetView.addSubview(targetLabelInstance)
    }
    
    // ラベルの初期化処理
    func setFirstString(targetLabelInstance:UILabel) {
        // ラベルの初期化
        targetLabelInstance.text = ""
    }
    
    // ラベルの表示処理
    func changeLabelString(messageString:String, targetLabelInstance:UILabel) {
        // ラベルの表示処理
        targetLabelInstance.text = messageString
    }
    
}

