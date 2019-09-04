//
//  GameScene.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 31/08/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
        
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
//        let action = {
//            print("That is a Click!")
//        }
//        
//        let button = SKButtonNode(size: CGSize(width: 100, height: 100),
//                                  withColor: .purple, action: action)
//
//        self.addChild(button)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
