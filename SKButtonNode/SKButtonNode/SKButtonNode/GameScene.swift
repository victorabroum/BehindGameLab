//
//  GameScene.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 31/08/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
        
        day09_colision()
        
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
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
    
    private func day09_colision() {
        
        self.physicsWorld.contactDelegate = self
        
        let centerNode = SKShapeNode(circleOfRadius: 30)
        centerNode.name = "centerNode"
        centerNode.fillColor = .purple
        centerNode.strokeColor = .clear
        
        centerNode.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        centerNode.physicsBody!.affectedByGravity = false
        centerNode.physicsBody!.categoryBitMask = 1
        centerNode.physicsBody!.collisionBitMask = 0
        centerNode.physicsBody!.contactTestBitMask = 1
        
        self.addChild(centerNode)
        
        let playerNode = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
        playerNode.name = "playerNode"
        playerNode.fillColor = .random
        playerNode.strokeColor = .clear
        playerNode.position.x -= 200
        
        playerNode.physicsBody = SKPhysicsBody(rectangleOf: playerNode.frame.size)
        playerNode.physicsBody!.affectedByGravity = false
        playerNode.physicsBody!.categoryBitMask = 1
        playerNode.physicsBody!.collisionBitMask = 0
        playerNode.physicsBody!.contactTestBitMask = 1
        
        let moveToRight = SKAction.moveBy(x: 400, y: 0, duration: 3)
        let sequence = SKAction.sequence([moveToRight, moveToRight.reversed()])
        
        playerNode.run(.repeatForever(sequence))
        
        self.addChild(playerNode)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "playerNode",
            let playerNode = nodeA as? SKShapeNode {
            playerNode.fillColor = .random
        }
        
        if nodeB.name == "playerNode",
            let playerNode = nodeB as? SKShapeNode {
            playerNode.fillColor = .random
        }
        
    }
    
}



