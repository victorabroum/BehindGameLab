//
//  CircleComponent.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 03/09/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import Foundation
import GameplayKit

class CircleComponent: GKComponent {
    
    @GKInspectable var radius: CGFloat = 30
    
    override init() {
        super.init()
    }
    
    // This function is called when this
    // component is inserted into an entity
    override func didAddToEntity() {
        super.didAddToEntity()
        
        guard let node = self.entity?.component(
            ofType: GKSKNodeComponent.self)?.node else { return }
        
        let circleNode = SKShapeNode(circleOfRadius: radius)
        circleNode.strokeColor = .clear
        circleNode.fillColor = .purple
        node.addChild(circleNode)
        
        if node.userData != nil,
            let color = node.userData!["color"] as? String {
            circleNode.fillColor = .hexStringToUIColor(hex: color)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
