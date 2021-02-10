//
//  OperateDatabeseModel.swift
//  AgentBlackAndWhiteApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

struct OperateDatabase {
    
    // MARK: - データベースの操作に必要な変数宣言
    // データベースへのパスの指定
    var database = Firestore.firestore()
    var ref: DocumentReference? = nil
    // リアルタイム更新に必要な監視状態のフラグ？
    var listener: ListenerRegistration?
    
    // MARK: - データベースの操作
    // データベースへの書き込み処理
    mutating func makeDatabase(targetCollection: String, inputDataDic: [String: Any]) -> String {
        // 格納先、格納するデータを指定して格納
        ref = database.collection(targetCollection).addDocument(data: inputDataDic) { [self] err in
            // エラーが発生した場合
            if let err = err {
                // エラーが発生した場合の目印:print("-----------------------------------------")
                print("-----------------------------------------")
                print("Error At makeDatabase(): \(err)")
            } else {
            // 成功した場合
                // 成功した場合の目印:print("==========================================")
                print("==========================================")
                print("document added with ID: \(ref!.documentID)")
            }
        }
        // ユーザーのユニークIDを発行してもらう
        return ref!.documentID
        
    }
    // データベースへの書き込み処理
    mutating func updateDatabase(targetCollection: String, inputData: [String: Any], userID: String, TargetFieldName: String, dicOfTarget: [String: Any]) {
        // 格納先を指定
        ref = database.collection(targetCollection).document(userID)
        ref!.updateData([TargetFieldName: dicOfTarget[TargetFieldName]]) { (err) in
            // エラーが発生した場合
            if let err = err {
                print("-----------------------------------------")
                print("Error At updateDatabase(): \(err)")
            } else {
            // 成功した場合
                print("==========================================")
                print("document successfully updated")
            }
        }
    }
    
    // データベースの検索処理
    func searchDatabase(targetCorection: String, argetFieldName: String, dicOfTarget: [String: Any]) -> String {
        
    }
    
    // データベースのリアルタイム更新の監視処理
    func realTimeMonitor(targetCorection: String) {
        
    }
    // データベースの削除処理
    func deleteDatabaseData(targetCorection: String) {
        
    }
}
