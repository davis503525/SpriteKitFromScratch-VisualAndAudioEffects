//
//  ViewController.swift
//  SpriteKit Introduction
//
//  Created by Davis Allie on 9/04/16.
//  Copyright © 2016 tutsplus. All rights reserved.
//

import UIKit
import SpriteKit

enum ButtonDirection: Int {
    case Left = 0, Right = 1
}

class ViewController: UIViewController {
    
    var stateMachine: LaneStateMachine!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = SKView(frame: self.view.frame)
        let scene = MainScene(fileNamed: "MainScene")!
        skView.presentScene(scene)
        self.view.insertSubview(skView, atIndex: 0)
        
        let left = LeftLane(player: scene.player)
        let middle = MiddleLane(player: scene.player)
        let right = RightLane(player: scene.player)
        
        self.stateMachine = LaneStateMachine(states: [left, middle, right])
        self.stateMachine.enterState(MiddleLane)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressButton(sender: UIButton) {
        switch sender.tag {
        case ButtonDirection.Left.rawValue:
            switch self.stateMachine.currentState {
            case is RightLane:
                self.stateMachine.enterState(MiddleLane)
            case is MiddleLane:
                self.stateMachine.enterState(LeftLane)
            default:
                break
            }
        case ButtonDirection.Right.rawValue:
            switch self.stateMachine.currentState {
            case is LeftLane:
                self.stateMachine.enterState(MiddleLane)
            case is MiddleLane:
                self.stateMachine.enterState(RightLane)
            default:
                break
            }
        default:
            break
        }
    }
}

