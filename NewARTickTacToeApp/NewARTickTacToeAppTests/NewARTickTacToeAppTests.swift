//
//  NewARTickTacToeAppTests.swift
//  NewARTickTacToeAppTests
//
//  Created by 尾原徳泰 on 2020/10/11.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import XCTest
@testable import NewARTickTacToeApp

class NewARTickTacToeAppTests: XCTestCase {

    func PlayerModel() {
        let player = Player()
        
        for num in 0...9 {
            let testFunc = player.player(count: num)
            let playerName = testFunc.0
            let playerColor = testFunc.1
            
            // 奇数入力で１PかつplayerColor１
            // 偶数入力で２PかつplayerColor２
            switch num {
            case 0:
                XCTAssertEqual(playerName, "2P")
                XCTAssertEqual(playerColor, 2)
            case 1:
                XCTAssertEqual(playerName, "1P")
                XCTAssertEqual(playerColor, 1)
            case 2:
                XCTAssertEqual(playerName, "2P")
                XCTAssertEqual(playerColor, 2)
            case 3:
                XCTAssertEqual(playerName, "1P")
                XCTAssertEqual(playerColor, 1)
            case 4:
                XCTAssertEqual(playerName, "2P")
                XCTAssertEqual(playerColor, 2)
            case 5:
                XCTAssertEqual(playerName, "1P")
                XCTAssertEqual(playerColor, 1)
            case 6:
                XCTAssertEqual(playerName, "2P")
                XCTAssertEqual(playerColor, 2)
            case 7:
                XCTAssertEqual(playerName, "1P")
                XCTAssertEqual(playerColor, 1)
            case 8:
                XCTAssertEqual(playerName, "2P")
                XCTAssertEqual(playerColor, 2)
            case 9:
                XCTAssertEqual(playerName, "1P")
                XCTAssertEqual(playerColor, 1)
            
            default:
                print("Test testPlayer Do Error")
            }
        }
    }
    
    func testSaveColoerModel() {
        let saveColor = SaveColor()
        
        let test1PColorDic: [Int: Int] = [1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 1, 7: 1, 8: 1, 9: 1]
        let test2PColorDic: [Int: Int] = [1: 2, 2: 2, 3: 2, 4: 2, 5: 2, 6: 2, 7: 2, 8: 2, 9: 2]
        
        // 1Pバージョンのテスト
        for (inputColor, placeNumber) in test1PColorDic {
            let testSaveColor = saveColor.saveColor(inputColor: 1, placeNumber: placeNumber)
            // 出力：色のテスト
            XCTAssertEqual(testSaveColor[placeNumber], 1)
        }
        
        // 2Pバージョンのテスト
        for (inputColor, placeNumber) in test1PColorDic {
            let testSaveColor = saveColor.saveColor(inputColor: 2, placeNumber: placeNumber)
            XCTAssertEqual(testSaveColor[placeNumber], 2)
        }
    }
    
    func testJudgementWinerModel1P() {
        let judgementWiner = JudgmentWiner()
        var count = 0
        // プレイヤーが勝利した時のパターン配列
        // 横一列
        let winPatternDic1: [Int: Int] = [1: 1, 2: 1, 3: 1]
        let winPatternDic2: [Int: Int] = [4: 1, 5: 1, 6: 1]
        let winPatternDic3: [Int: Int] = [7: 1, 8: 1, 9: 1]
        // 縦一列
        let winPatternDic4: [Int: Int] = [1: 1, 4: 1, 7: 1]
        let winPatternDic5: [Int: Int] = [2: 1, 5: 1, 8: 1]
        let winPatternDic6: [Int: Int] = [3: 1, 6: 1, 9: 1]
        // 斜め一列
        let winPatternDic7: [Int: Int] = [1: 1, 5: 1, 9: 1]
        let winPatternDic8: [Int: Int] = [3: 1, 5: 1, 7: 1]
        
        let winPatternArray = [winPatternDic1, winPatternDic2, winPatternDic3, winPatternDic4, winPatternDic5, winPatternDic6, winPatternDic7, winPatternDic8]
        
        for num in 0...9 {
            for number1 in 0...2 {
                    for number2 in 0...2 {
                        for number3 in 0...2 {
                            for number4 in 0...2 {
                                for number5 in 0...2 {
                                    for number6 in 0...2 {
                                        for number7 in 0...2 {
                                            for number8 in 0...2 {
                                                for number9 in 0...2 {
                                                    let dic: [Int: Int] = [1: number1, 2: number2, 3: number3, 4: number4, 5: number5, 6: number6, 7: number7, 8: number8, 9: number9]
//                                                    print(dic)
                                                    
                                                    let returnNmber = judgementWiner.judgmentWiner(colorDic: dic, count: num)
                                                    for array in winPatternArray {
                                                        if dic == array {
                                                            XCTAssertEqual(returnNmber, 1)
//                                                            print("-----------------------------------")
//                                                            print("dic:\(dic)")
//                                                            print("array:\(array)")
                                                            count += 1
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
//        print("count:\(count)")
        }
        

    func testJudgementWinerModel2P() {
        let judgementWiner = JudgmentWiner()
    
        // プレイヤーが勝利した時のパターン配列
        // 横一列
        let winPatternDic1: [Int: Int] = [1: 2, 2: 2, 3: 2]
        let winPatternDic2: [Int: Int] = [4: 2, 5: 2, 6: 2]
        let winPatternDic3: [Int: Int] = [7: 2, 8: 2, 9: 2]
        // 縦一列
        let winPatternDic4: [Int: Int] = [1: 2, 4: 2, 7: 2]
        let winPatternDic5: [Int: Int] = [2: 2, 5: 2, 8: 2]
        let winPatternDic6: [Int: Int] = [3: 2, 6: 2, 9: 2]
        // 斜め一列
        let winPatternDic7: [Int: Int] = [1: 2, 5: 2, 9: 2]
        let winPatternDic8: [Int: Int] = [3: 2, 5: 2, 7: 2]
        
        let winPatternArray = [winPatternDic1, winPatternDic2, winPatternDic3, winPatternDic4, winPatternDic5, winPatternDic6, winPatternDic7, winPatternDic8]
    
        for num in 0...9 {
            for number1 in 0...2 {
                    for number2 in 0...2 {
                        for number3 in 0...2 {
                            for number4 in 0...2 {
                                for number5 in 0...2 {
                                    for number6 in 0...2 {
                                        for number7 in 0...2 {
                                            for number8 in 0...2 {
                                                for number9 in 0...2 {
                                                    let dic: [Int: Int] = [1: number1, 2: number2, 3: number3, 4: number4, 5: number5, 6: number6, 7: number7, 8: number8, 9: number9]
                                                    print(dic)
                                                
                                                    let returnNmber = judgementWiner.judgmentWiner(colorDic: dic, count: num)
                                                    for array in winPatternArray {
                                                        if dic == array {
                                                            XCTAssertEqual(returnNmber, 2)
//                                                            print("-----------------------------------")
//                                                            print("dic:\(dic)")
//                                                            print("array:\(array)")
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    
    func testJudgementWinerModelDraw() {
        let judgementWiner = JudgmentWiner()
//        var count = 0
        // プレイヤーが勝利した時のパターン配列
        // 横一列
        let winPatternDic11: [Int: Int] = [1: 1, 2: 1, 3: 1]
        let winPatternDic12: [Int: Int] = [4: 1, 5: 1, 6: 1]
        let winPatternDic13: [Int: Int] = [7: 1, 8: 1, 9: 1]
        // 縦一列
        let winPatternDic14: [Int: Int] = [1: 1, 4: 1, 7: 1]
        let winPatternDic15: [Int: Int] = [2: 1, 5: 1, 8: 1]
        let winPatternDic16: [Int: Int] = [3: 1, 6: 1, 9: 1]
        // 斜め一列
        let winPatternDic17: [Int: Int] = [1: 1, 5: 1, 9: 1]
        let winPatternDic18: [Int: Int] = [3: 1, 5: 1, 7: 1]
        
        // プレイヤーが勝利した時のパターン配列
        // 横一列
        let winPatternDic21: [Int: Int] = [1: 2, 2: 2, 3: 2]
        let winPatternDic22: [Int: Int] = [4: 2, 5: 2, 6: 2]
        let winPatternDic23: [Int: Int] = [7: 2, 8: 2, 9: 2]
        // 縦一列
        let winPatternDic24: [Int: Int] = [1: 2, 4: 2, 7: 2]
        let winPatternDic25: [Int: Int] = [2: 2, 5: 2, 8: 2]
        let winPatternDic26: [Int: Int] = [3: 2, 6: 2, 9: 2]
        // 斜め一列
        let winPatternDic27: [Int: Int] = [1: 2, 5: 2, 9: 2]
        let winPatternDic28: [Int: Int] = [3: 2, 5: 2, 7: 2]
            
        let winPatternArray1 = [winPatternDic11, winPatternDic12, winPatternDic13, winPatternDic14, winPatternDic15, winPatternDic16, winPatternDic17, winPatternDic18]
        
        let winPatternArray2 = [winPatternDic21, winPatternDic22, winPatternDic23, winPatternDic24, winPatternDic25, winPatternDic26, winPatternDic27, winPatternDic28]
            
        for num in 0...9 {
            for number1 in 0...2 {
                for number2 in 0...2 {
                    for number3 in 0...2 {
                        for number4 in 0...2 {
                            for number5 in 0...2 {
                                for number6 in 0...2 {
                                    for number7 in 0...2 {
                                        for number8 in 0...2 {
                                            for number9 in 0...2 {
                                                let dic: [Int: Int] = [1: number1, 2: number2, 3: number3, 4: number4, 5: number5, 6: number6, 7: number7, 8: number8, 9: number9]
    //                                                    print(dic)
                                                        
                                                let returnNmber = judgementWiner.judgmentWiner(colorDic: dic, count: 9)
                                                for array1 in winPatternArray1 {
                                                    for array2 in winPatternArray2 {
                                                        if (dic != array1 && dic != array2) && num == 9{
                                                            XCTAssertEqual(returnNmber, 3)
//                                                            print("-----------------------------------")
//                                                            print("dic:\(dic)")
//                                                            print("array1:\(array1)")
//                                                            print("array2:\(array2)")
//                                                            print("num:\(num)")
                                                        //                                                        count += 1
                                                        }
                                                    }
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
//        print("count:\(count)")
    }
}
