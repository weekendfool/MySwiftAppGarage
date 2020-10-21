//
//  RecordColoerModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class SaveColor {
    
    var colorDic: [Int: Int] = [1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
    
    // 色の記録処理
    func saveColor(inputColor: Int, placeNumber: Int) -> [Int: Int] {
        
        // 入力された場所と数字を記録
        colorDic[placeNumber] = inputColor
        // 返り値として色が格納された辞書を返す
        return colorDic
    }
    
    // 色格納用辞書のリセット処理
    func resetColorDic() {
        for num in 1...9 {
            colorDic[num] = 0
        }
    }
    
}
