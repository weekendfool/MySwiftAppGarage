//
//  SetARModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/23.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit

struct SetAR {
    
    func setAR(targetViewController: UIViewController, targetSceneView: ARSCNView) {
        
        // デリゲートの設定
        targetSceneView.delegate = targetViewController as! ARSCNViewDelegate
        // シーンの作成
        targetSceneView.scene = SCNScene()
        // 光原の設定
        targetSceneView.automaticallyUpdatesLighting = true
        // 平面の検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        targetSceneView.session.run(configuration)
    }
    
}
