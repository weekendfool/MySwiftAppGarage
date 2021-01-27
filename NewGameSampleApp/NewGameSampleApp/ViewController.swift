//
//  ViewController.swift
//  NewGameSampleApp
//
//  Created by 尾原徳泰 on 2021/01/22.
//  Copyright © 2021 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var elevenButton: UIButton!
    @IBOutlet weak var twelveButton: UIButton!
    @IBOutlet weak var thirteenButton: UIButton!
    @IBOutlet weak var fourteenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var sixteenButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var normalAgentButton: UIButton!
    @IBOutlet weak var normalAgentLabel: UILabel!
    @IBOutlet weak var glayAgentButton: UIButton!
    @IBOutlet weak var glayAgentLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    var count = 0
    // 各インスタンスの作成
    let player = Player()
    let saveColor = SaveColor()
    let makeField = MakeField()
    let setAR = SetAR()
    let makePawn = Pawn()
    let deleteAR = DeleteAR()
    let judmentWiner = JudmentWiner()
    let judgementBetrayer = JudgementBetrayer()
    let buttonProcessing = ButtonProcessing()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAR.setAR(targetViewController: self, targetSceneView: sceneView)
        startButton.isEnabled = true
        startButton.isHidden = false
    }
   
    // MARK: - ARSCNViewDelegate
    
    @IBAction func startButtonPressed(_ sender: Any) {
        // フィールドを展開する
        makeField.makeField(targetSceneView: sceneView)
        // ボタンを非表示
        startButton.isEnabled = false
        startButton.isHidden = true
        
        count += 1
    }
    
    // ボタンの動作を記述
    func buttonAction(buttonNumber: Int, count: Int) {
        // 
        player.makePlayer(count: count)
    }

    
    @IBAction func oneButtonPressed(_ sender: Any) {
    }
    @IBAction func twoButtonPressed(_ sender: Any) {
    }
    @IBAction func threeButtonPressed(_ sender: Any) {
    }
    
    @IBAction func fourButtonPressed(_ sender: Any) {
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
    }
    @IBAction func sixButtonPressed(_ sender: Any) {
    }
    @IBAction func sevenButtonPressed(_ sender: Any) {
    }
    
    @IBAction func eightButtonPressed(_ sender: Any) {
    }
    @IBAction func nineButtonPressed(_ sender: Any) {
    }
    @IBAction func tenButtonPressed(_ sender: Any) {
    }
    @IBAction func elevenButtonPressed(_ sender: Any) {
    }
    @IBAction func tewlveButtonPressed(_ sender: Any) {
    }
    
    @IBAction func thirteenButtonPressed(_ sender: Any) {
    }
    @IBAction func fourteenButtonPressed(_ sender: Any) {
    }
    @IBAction func fifteenButtonPressed(_ sender: Any) {
    }
    @IBAction func sixteenButtonPressed(_ sender: Any) {
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    @IBAction func normalAgentButtonPressed(_ sender: Any) {
    }
    
    @IBAction func glaynormalAgentButtonPressed(_ sender: Any) {
    }
    
   
}
