//
//  JudgementWinerModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

// 勝負の判定機能
func judgmentWiner(colorDic: [Int: Int], count: Int) -> Int {
    //　引数の辞書の色をそれぞれ格納
    let dic1 = colorDic[1]
    let dic2 = colorDic[2]
    let dic3 = colorDic[3]
    let dic4 = colorDic[4]
    let dic5 = colorDic[5]
    let dic6 = colorDic[6]
    let dic7 = colorDic[7]
    let dic8 = colorDic[8]
    let dic9 = colorDic[9]
    // 返り値の格納用変数
    var returnNmber = 0
    
    //勝敗が決まるかの判定を二色分for文で行う
    for num in 1...2 {
        if (dic1 == num && dic2 == num && dic3 == num) {
           returnNmber = num
        } else if (dic4 == num && dic5 == num && dic6 == num) {
            returnNmber = num
        } else if (dic7 == num && dic8 == num && dic9 == num) {
            returnNmber = num
        } else if (dic1 == num && dic4 == num && dic7 == num) {
            returnNmber = num
        } else if (dic2 == num && dic5 == num && dic8 == num) {
            returnNmber = num
        } else if (dic3 == num && dic6 == num && dic9 == num) {
            returnNmber = num
        } else if (dic1 == num && dic5 == num && dic9 == num) {
            returnNmber = num
        } else if (dic3 == num && dic5 == num && dic7 == num) {
            returnNmber = num
        } else if count == 9  {
            returnNmber = 3
        }
    }
    return returnNmber
}
