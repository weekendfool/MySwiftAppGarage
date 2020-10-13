//
//  MakeFieldModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

// カメラ座標の中心座標を記録してフィールドを展開する処理
func makeField(targetSceneView: ARSCNView) {
    // 座標の決定
    //　カメラ座標系で50㎝手前にfieldの中心を設置
    let infrontOfCamera = SCNVector3(x: 0, y: 0, z: -0.5)
    
    //　カメラ座標系からワールド座標系に変換する
    guard let cameraNode = targetSceneView.pointOfView else { return }
    let pointInWorld = cameraNode.convertPosition(infrontOfCamera, to: nil)
    // 変換した座標を記録
    fieldPoint = pointInWorld
    
    // scnファイルからシーンを読みこむ
    let fieldScene = SCNScene(named: "art.scnassets/field.scn")
    // シーンからノードを検索
    fieldNode = (fieldScene?.rootNode.childNode(withName: "field", recursively: false))!
    // 表示する座標を指定
    fieldNode!.position = pointInWorld
    // ノードの作成
    targetSceneView.scene.rootNode.addChildNode(fieldNode!)

}
