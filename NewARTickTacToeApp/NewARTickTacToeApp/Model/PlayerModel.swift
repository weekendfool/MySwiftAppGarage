//
//  PlayerModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/11.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

//　プレイヤーを確定する変数
class Player {
    
    func player(count: Int) -> (String, Int) {
        //　返り値を格納する変数
        var playerName = ""
        var playerColoer = 0
        // countの奇数偶数で場合分けする
        if count % 2 == 1{
            playerName = "1P"
            playerColoer = 1
        } else {
            playerName = "2P"
            playerColoer = 2
        }

            return (playerName, playerColoer)
    }
    
    
    
}
