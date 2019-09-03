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
        
        let action = {
            print("That is a Click!")
        }
        
        let button = SKButtonNode(size: CGSize(width: 100, height: 100),
                                  withColor: .purple, action: action)
        
        self.addChild(button)
        
        // SKNode, an empty Node just to encapsulate other nodes
        let node = SKNode()
        self.addChild(node)
        
        // SKSpriteNode, a Node with a texture
        let spriteNode = SKSpriteNode(imageNamed: "myTexture")
        self.addChild(spriteNode)
        
        // SKLightNode, a Node to represent light on Scene
        let lightNode = SKLightNode()
        self.addChild(lightNode)
        
        // SKEmitterNode, a Node to particles
        let emitterNode = SKEmitterNode(fileNamed: "emitterFile")!
        self.addChild(emitterNode)
        
        // SKLabelNode, a Node to show labels
        let labelNode = SKLabelNode(text: "Hello Games!")
        self.addChild(labelNode)
        
        // SKShapeNode, a Node with some geometric shapes
        let shapeNode = SKShapeNode(circleOfRadius: 20)
        self.addChild(shapeNode)
        
        // SKTileMapNode, a Node for tiles Map
        let tileMapNode = SKTileMapNode(fileNamed: "myTileMapFile")!
        self.addChild(tileMapNode)
        
        // SKCameraNode, a Node to work with canva camera
        let cameraNode = SKCameraNode()
        self.addChild(cameraNode)
        
        // SKAudioNode, a Node to play sounds
        let audioNode = SKAudioNode(fileNamed: "myAudioFile")!
        self.addChild(audioNode)
        
        
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
