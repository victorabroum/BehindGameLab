//
//  SquareComponent.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 03/09/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import Foundation
import GameplayKit

class SquareComponent: GKComponent {
    
    @GKInspectable var size = CGSize(width: 100, height: 100)
    
    override init() {
        super.init()
    }
    
    // This function is called when this
    // component is inserted into an entity
    override func didAddToEntity() {
        super.didAddToEntity()
        
        guard let node = self.entity?.component(ofType: GKSKNodeComponent.self)?.node else { return }
        
        let squareNode = SKShapeNode(rectOf: size)
        squareNode.strokeColor = .clear
        squareNode.fillColor = .green
        node.addChild(squareNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
