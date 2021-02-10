//
//  RoomModel.swift
//  AgentBlackAndWhiteApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation

struct Room {
    
    // データベース内でのルームが持つ情報を宣言
    // 作成されたルームのID
    var roomID = ""
    // 招待されたユーザーのID
    var invitedUserID = ""
    // ルームを作成したユーザーのID
    var hostUserID = ""
    // ルームを作成したユーザーがフィールドを展開したかどうかのフラグ
    var invitedUserStartFlag = false
    // 招待されたユーザーがフィールドを展開したかどうかのフラグ
    var hostUserStartFlag = false
    // 打った手の座標を記録する変数
    var firstMoveCordinate = ""
    var secondMoveCordinate = ""
    var thirdMoveCordinate = ""
    var fourthMoveCordinate = ""
    var fifthMoveCordinate = ""
    var sixthMoveCordinate = ""
    var sevenMoveCordinate = ""
    var eighthMoveCordinate = ""
    var ninthMoveCordinate = ""
    var tenthMoveCordinate = ""
    var eleventhMoveCordinate = ""
    var twelfthMoveCordinate = ""
    var thirteenthMoveCordinate = ""
    var fourteenthCordinate = ""
    var fifteenthCordinate = ""
    var sixteenthMoveCordinate = ""
    // 招待されたユーザーの裏切りが何手目かを記録する変数
    var betrayerOfinvitedUser = ""
    // ルームを作成したユーザーの裏切りが何手目かを記録する変数
    var betrayerOfhostUser = ""
    
}
