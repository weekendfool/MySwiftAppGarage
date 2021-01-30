//
//  PopupModel.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/30.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

struct PopUP {
    
    func popuUp(view: UIView, targetViiew: UIViewController) -> UIViewController {
        let contentVC = ContentViewController()
        // スタイルの指定
        contentVC.modalPresentationStyle = .popover
        // サイズの指定
        contentVC.preferredContentSize = CGSize(width: 200, height: 200)
        //　表示するviewの指定
        contentVC.popoverPresentationController?.sourceView = view
        // 表示する位置の指定
        contentVC.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: 200, height: 200)
        // デリゲートの指定
        contentVC.popoverPresentationController?.delegate = targetViiew as! UIPopoverPresentationControllerDelegate
        
        // 表示
        return contentVC
    }
    
    
    
}
