//
//  DeleteAR.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import ARKit
import SceneKit

class DeleteAR {
    
    func deleteAR(nodeArray: [SCNNode]) {
        // ノードの削除
        for node in nodeArray {
//            if let node = node {
                node.removeFromParentNode()
//            }
        }
    }
    
}
