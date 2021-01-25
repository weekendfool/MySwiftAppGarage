//
//  JudgementBetrayerModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/24.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation


struct JudgementBetrayer {
    
    // 裏切り者を格納する辞書を宣言[赤or青: 置かれたマス]
    var betrayerDic: [Int: Int] = [1: 0, 2: 0]
    
    // 裏切り者を記録する
    mutating func recordBetrayer(choosePlayerNumber:Int, choosePlaceNumber:Int) {
        // 裏切り者を格納する
        betrayerDic[choosePlayerNumber] = choosePlaceNumber
    }
    
    // 裏切り者の判定を行いコマの再配置を行う
    func judgementBetrayer(beforeColorDic: [Int: Int]) -> [Int: Int] {
        // 返り値を格納する辞書
        var afterColorDic: [Int: Int]?
        
        // 作った辞書に情報をコピーする
        for num in 1...16 {
            afterColorDic![num] = beforeColorDic[num]
        }
        
        // 裏切り者の情報を反映
        afterColorDic![betrayerDic[1]!] = 1
        afterColorDic![betrayerDic[2]!] = 2
        
        return  afterColorDic!
    }
}
