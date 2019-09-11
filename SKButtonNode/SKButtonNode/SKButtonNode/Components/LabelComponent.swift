//
//  LabelComponent.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 07/09/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import Foundation
import GameplayKit

class LabelComponent: GKComponent {
    
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
            
            if let text = userData["text"] as? String {
                var fontSize = userData["fontSize"] as? Int
                fontSize = fontSize != nil ? fontSize : 22
                let labelNode = SKLabelNode(text: text)
                labelNode.fontSize = CGFloat(fontSize!)
                
                labelNode.lineBreakMode = .byTruncatingTail
                labelNode.numberOfLines = 0
                labelNode.verticalAlignmentMode = .center
                labelNode.preferredMaxLayoutWidth =
                    node.calculateAccumulatedFrame().width - 35
                labelNode.zPosition = 10
                
                node.addChild(labelNode)
                
            }
            
        }
    }
}
