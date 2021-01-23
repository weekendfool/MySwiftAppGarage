//
//  MakePawnModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/23.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit

struct Pawn {
    
    // ポーンを生成する処理
    func makePawn(playerColor: Int, fieldNumber: Int, fieldPoint: SCNVector3, targetSceneView: ARSCNView) -> SCNNode {
        
        // fieldのオブジェクト座標から算出した値を格納する変数3軸分
        var newStagePointX: Float?
        var newStagePointY: Float?
        var newStagePointZ: Float?
        
        // pawnの色を格納する変数
        var pawnNode: SCNNode?
        
        // playerの番号で色分けする
        if playerColor == 1 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/red.scn")
            // シーンからノードを検索
            let redNode = (scene?.rootNode.childNode(withName: "red", recursively: false))!
            pawnNode = redNode
        } else if playerColor == 2 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/blue.scn")
            // シーンからノードを検索
            let redNode = (scene?.rootNode.childNode(withName: "blue", recursively: false))!
            pawnNode = redNode
        }
        
        // 選択された場所により生成する座標を変える
        switch fieldNumber {
        case 1:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 2:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 3:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 4:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 5:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 6:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 7:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 8:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 9:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 10:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 11:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 12:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 13:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 14:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 15:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        case 16:
            newStagePointX = fieldPoint.x - 0.0098; newStagePointY = fieldPoint.y + 0.081; newStagePointZ = fieldPoint.z + 0.095
        default:
            print("Make Pawn Error")
        }
        
        // 新しいオブジェクトの座標を規定
        let newFieldPoint = SCNVector3(x: newStagePointX!, y: newStagePointY!, z: newStagePointZ!)
        
        // ノードの大きさ変更
        pawnNode!.scale = SCNVector3(x: 0.02, y: 0.02, z: 0.02)
        // ノードの作成
        targetSceneView.scene.rootNode.addChildNode(pawnNode!)
        
        return pawnNode!
        
    }
}
