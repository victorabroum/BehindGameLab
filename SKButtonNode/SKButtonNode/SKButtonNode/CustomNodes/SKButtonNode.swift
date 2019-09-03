//
//  SKButtonNode.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 31/08/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import Foundation
import SpriteKit

class SKButtonNode: SKNode {
    
    var action: (() -> Void)?
    
    init(size: CGSize, withColor color: UIColor, action: (() -> Void)? = nil) {
        self.action = action
        super.init()
        
        // Create a Box for Button "Texture"
        let shape = SKShapeNode(rectOf: size)
        shape.fillColor = color
        shape.strokeColor = .clear
        
        self.addChild(shape)
        
        // This is the most important step,
        // it allows the user to click on the node.
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If didn't have an action just return
        guard let action = self.action else { return }
        action()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
