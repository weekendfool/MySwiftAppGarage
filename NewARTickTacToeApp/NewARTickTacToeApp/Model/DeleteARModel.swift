//
//  DeleteAR.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class DeleteAR {
    
    func deleteAR(fieldNode: SCNNode, pawnNode: SCNNode) {
        // ノードの削除
        if let field = fieldNode {
            field.removeFromParentNode()
        }
        if let pawn = pawnNode {
            pawn.removeFromParentNode()
        }
        print("OK")
    }
    
}
