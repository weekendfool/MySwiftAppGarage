//
//  MakePawnModle.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

class Pawn {
    // ポーンを生成する処理
    func makePawn(player: Int, fieldNumber: Int) {
                
//        // pawanの場所を格納する変数
//        var pawnPoint:SCNVector3?
        //　fieldのオブジェクト座標から計算で出した値を格納する変数を３軸文用意
        var newStagePintX:Float?
        var newStagePintZ:Float?
        var newStagePintY:Float?
    
    
        // playerにより赤か青か場合わけ
        if player == 1 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/redPawn.scn")
            // シーンからノードを検索
            let redNode = (scene?.rootNode.childNode(withName: "redPawn", recursively: false))!
            pawnNode = redNode
        } else if player == 2 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/bluePawn.scn")
            // シーンからノードを検索
            let blueNode = (scene?.rootNode.childNode(withName: "bluePawn", recursively: false))!
            pawnNode = blueNode
        }
        // 選択された場所により生成する場所の座標を変える
        switch fieldNumber {
        case 1:
            newStagePintX = fieldPoint!.x - 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z - 0.096
        case 2:
            newStagePintX = fieldPoint!.x + 0.000; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z - 0.096
        case 3:
            newStagePintX = fieldPoint!.x + 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z - 0.096
        case 4:
            newStagePintX = fieldPoint!.x - 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.000
        case 5:
            newStagePintX = fieldPoint!.x + 0.000; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.000
        case 6:
            newStagePintX = fieldPoint!.x + 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.000
        case 7:
            newStagePintX = fieldPoint!.x - 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.096
        case 8:
            newStagePintX = fieldPoint!.x + 0.000; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.096
        case 9:
            newStagePintX = fieldPoint!.x + 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.096
        default:
            return
        }
    
    }
}

