//
//  SetARModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit

class SettingAR {
    
//    @IBOutlet var sceneView: ARSCNView!
    
    func setAR(targetViewController: UIViewController, targetSceneView: ARSCNView) {
        // デリゲートの設定
        targetSceneView.delegate = targetViewController as! ARSCNViewDelegate
        // シーンの作成
        targetSceneView.scene = SCNScene()
        // 特徴点を表示する
//        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        //　光源の設定
        targetSceneView.autoenablesDefaultLighting = true
        // 平面の検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        targetSceneView.session.run(configuration)
    }
    
}
