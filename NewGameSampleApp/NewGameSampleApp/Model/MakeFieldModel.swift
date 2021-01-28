//
//  MakeFieldModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/22.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

struct MakeField {
    
    // カメラの50センチまえにおいて、固定する
    func makeField(targetSceneView: ARSCNView) -> SCNVector3 {
        // 座標の決定
        // カメラ座標系で５０センチ前にフィールドの中心を設定
        let infrontOfCamera = SCNVector3(0, 0, -0.5)
        // 返り値を格納する変数
        var fieldPoint: SCNVector3?
        // フィールドノードのを記録する変数
        var fieldNode: SCNNode?
        
        // カメラ座標系からワールド座標系に変換する
        guard let cameraNode = targetSceneView.pointOfView else { fatalError("Can't Find PointOfView") }
        fieldPoint = cameraNode.convertPosition(infrontOfCamera, to: nil)
        
        // scnファイルからシーンを読み込む
        let fieldScene = SCNScene(named: "art.scnassets/newField.scn")
        // シーンからノードを検索する
        fieldNode = (fieldScene?.rootNode.childNode(withName: "field", recursively: false))!
        // 表示する座標を指定
        fieldNode!.position = fieldPoint!
        // ノードの作成
        targetSceneView.scene.rootNode.addChildNode(fieldNode!)
        
        return fieldPoint!
    }
    
}
