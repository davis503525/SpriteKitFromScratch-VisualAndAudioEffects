//
//  LaneStateMachine.swift
//  SpriteKit Introduction
//
//  Created by Davis Allie on 17/04/16.
//  Copyright © 2016 tutsplus. All rights reserved.
//

import Foundation
import GameplayKit

class LaneStateMachine: GKStateMachine {
    
}

class LaneState: GKState {
    var playerNode: PlayerNode
    
    init(player: PlayerNode) {
        self.playerNode = player
    }
}

class LeftLane: LaneState {
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        if stateClass == MiddleLane.self {
            return true
        }
        
        return false
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        self.playerNode.moveInDirection(.Left, toLane: self)
    }
}

class MiddleLane: LaneState {
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        if stateClass == LeftLane.self || stateClass == RightLane.self {
            return true
        }
        
        return false
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        if previousState is LeftLane {
            self.playerNode.moveInDirection(.Right, toLane: self)
        } else if previousState is RightLane {
            self.playerNode.moveInDirection(.Left, toLane: self)
        }
    }
}

class RightLane: LaneState {
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        if stateClass == MiddleLane.self {
            return true
        }
        
        return false
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        self.playerNode.moveInDirection(.Right, toLane: self)
    }
}
