//
//  DeleteARModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/23.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation
import ARKit
import SceneKit

struct DeleteAR {
    
    func deleteAR(nodeArray: [SCNNode]) {
        
        //　nodeArrayが空でない場合削除
        guard nodeArray.count == 0 else {
            for node in nodeArray {
                node.removeFromParentNode()
            }
        }
    }
    
}
