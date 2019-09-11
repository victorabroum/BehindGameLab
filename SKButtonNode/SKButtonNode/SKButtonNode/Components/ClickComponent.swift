//
//  ClickComponent.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 07/09/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import Foundation
import GameplayKit

class ClickComponent: GKComponent {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didAddToEntity() {
        super.didAddToEntity()
        
        if let node = self.entity?.component(
            ofType: GKSKNodeComponent.self)?.node,
            let userData = node.userData {
            
            let buttonNode = SKButtonNode(
                size: node.calculateAccumulatedFrame().size,
                withColor: .clear) {
                if let actionName = userData["action"] as? String,
                    let action = ButtonsActions.actions[actionName] {
                    print("ME CLICOU")
                    action(self.entity!)
                }
            }
            
            buttonNode.zPosition = 20
            node.addChild(buttonNode)
        }
        
    }
    
}
