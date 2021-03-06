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
import ARKit

class Pawn {
    
    
    // ポーンを生成する処理
    func makePawn(playerColor: Int, fieldNumber: Int, fieldPoint: SCNVector3, targetSceneView: ARSCNView) -> SCNNode {
                
//        // pawanの場所を格納する変数
//        var pawnPoint:SCNVector3?
        //　fieldのオブジェクト座標から計算で出した値を格納する変数を３軸文用意
        var newStagePintX:Float?
        var newStagePintZ:Float?
        var newStagePintY:Float?
    
        // pawanの色を格納する変数
        var pawnNode:SCNNode?
        
        // playerにより赤か青か場合わけ
        if playerColor == 1 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/redPawn.scn")
            // シーンからノードを検索
            let redNode = (scene?.rootNode.childNode(withName: "redPawn", recursively: false))!
            pawnNode = redNode
        } else if playerColor == 2 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/bluePawn.scn")
            // シーンからノードを検索
            let blueNode = (scene?.rootNode.childNode(withName: "bluePawn", recursively: false))!
            pawnNode = blueNode
        }
        
        // 選択された場所により生成する場所の座標を変える
        switch fieldNumber {
        case 1:
            newStagePintX = fieldPoint.x - 0.098; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z + 0.096
        case 2:
            newStagePintX = fieldPoint.x + 0.000; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z + 0.096
        case 3:
            newStagePintX = fieldPoint.x + 0.098; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z + 0.096
        case 4:
            newStagePintX = fieldPoint.x - 0.098; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z + 0.000
        case 5:
            newStagePintX = fieldPoint.x + 0.000; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z + 0.000
        case 6:
            newStagePintX = fieldPoint.x + 0.098; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z + 0.000
        case 7:
            newStagePintX = fieldPoint.x - 0.098; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z - 0.096
        case 8:
            newStagePintX = fieldPoint.x + 0.000; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z - 0.096
        case 9:
             newStagePintX = fieldPoint.x + 0.098; newStagePintY = fieldPoint.y + 0.081; newStagePintZ = fieldPoint.z - 0.096
        default:
            print("Make Pawn Error")
        }
        
        // 新しいオブジェクトの座標を規定
        let newFieldPoint = SCNVector3(x: newStagePintX!, y: newStagePintY!, z: newStagePintZ!)
        //　ワールド座標系に変換
        print("newStagePoint:\(newFieldPoint)")
//        let finalPoint = sceneView.projectPoint(newFieldPoint
//        print("finalPoint:\(finalPoint)")
        // ノードの大きさ変更
        pawnNode!.scale = SCNVector3(0.02, 0.02, 0.02)
        // 表示する座標を指定する
        pawnNode!.position = newFieldPoint
        // ノードの作成
        targetSceneView.scene.rootNode.addChildNode(pawnNode!)
    
        return pawnNode!
    }
    
    
}

