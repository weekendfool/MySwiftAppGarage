//
//  PlayerModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/22.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation

struct Player {
    
    func makePlayer(count: Int) -> (Int) {
        // 返り値を格納する変数
//        var playerName: String
        var playerColor: Int
        
        // countの奇数偶数で１pと２pの場合わけ
        if count % 2 == 1 {
//            playerName = "Blue"
            playerColor = 1
        } else {
//            playerName = "Red"
            playerColor = 2
        }
        
        return playerColor
    }
}
