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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
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
