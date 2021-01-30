//
//  PlayerModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/22.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation

struct Player {
    
    var playersDic = ["AgentBKGY": 2, "AgentBKN": 6, "AgentWTGY": 2, "AgentWTN": 6]
    
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
    
    mutating func playerInfo(playerColor: Int, selectAgent: Int) -> (Int, Int) {
        var normalAgwntNumber: Int?
        var betrayerAgentNumber: Int?
        
        switch playerColor {
        case 1:
            switch selectAgent {
            case 0:
                // ノーマルエージェントを選択
                normalAgwntNumber = playersDic["AgentBKN"]!
                betrayerAgentNumber = playersDic["AgentBKGY"]!
            case 1:
                // ノーマルエージェントを選択
                normalAgwntNumber = playersDic["AgentBKN"]! - 1
                betrayerAgentNumber = playersDic["AgentBKGY"]!
            case 2:
                // 裏切り者を選択
                betrayerAgentNumber = playersDic["AgentBKGY"]! - 1
                normalAgwntNumber = playersDic["AgentBKN"]!
            default:
                print("error")
            }
        case 2:
            switch selectAgent {
            case 0:
                // ノーマルエージェントを選択
                normalAgwntNumber = playersDic["AgentWTN"]!
                betrayerAgentNumber = playersDic["AgentWTGY"]!
            case 1:
                normalAgwntNumber = playersDic["AgentWTN"]! - 1
                betrayerAgentNumber = playersDic["AgentWTGY"]!
            case 2:
                betrayerAgentNumber = playersDic["AgentWTGY"]! - 1
                normalAgwntNumber = playersDic["AgentWTN"]!
            default:
                print("error")
        }
        default:
            normalAgwntNumber = 6
            betrayerAgentNumber = 2
            print("error")
        }
        
        
        return (normalAgwntNumber!, betrayerAgentNumber!)
    }
}
