//
//  MainScene.swift
//  SpriteKit Introduction
//
//  Created by Davis Allie on 16/04/16.
//  Copyright © 2016 tutsplus. All rights reserved.
//

import UIKit
import SpriteKit

class MainScene: SKScene {
    
    var player: PlayerNode!

    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        self.size = view.frame.size
        
        if let foundPlayer = self.childNodeWithName("Player") as? PlayerNode {
            self.player = foundPlayer
        }
        
        let center = self.size.width/2.0, difference = CGFloat(70.0)
        
        self.player.leftConstraint = SKConstraint.positionX(SKRange(constantValue: center - difference))
        self.player.middleConstraint = SKConstraint.positionX(SKRange(constantValue: center))
        self.player.rightConstraint = SKConstraint.positionX(SKRange(constantValue: center + difference))
        
        self.player.leftConstraint.enabled = false
        self.player.rightConstraint.enabled = false

        self.player.constraints = [self.player.leftConstraint, self.player.middleConstraint, self.player.rightConstraint]
    }

}
