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
    
    func player(count: Int) -> String {
        //　返り値を格納する変数
        var player = ""
        // countの奇数偶数で場合分けする
        if count % 2 == 1{
            player = "1P"
        } else {
            player = "2P"
        }
        
        if player == "" {
            return "Player Set Error"
        } else {
            return player
        }
    }
    
}
