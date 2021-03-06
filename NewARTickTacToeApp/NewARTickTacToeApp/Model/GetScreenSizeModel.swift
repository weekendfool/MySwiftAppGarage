//
//  GetScreenSizeModel.swift
//  NewARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/10/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

// スクリーンサイズの取得と返却
class GetScreenSize {
    
    // スクリーンサイズの取得
    func setScreenSize() -> (CGFloat, CGFloat){
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        // 取得したスクリーンサイズを返却
        return (screenWidth, screenHeight)
    }
}
