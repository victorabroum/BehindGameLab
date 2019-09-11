//
//  ButtonActions.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 07/09/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import Foundation
import GameplayKit

struct ButtonsActions {

    static let actions: [String : ((GKEntity) -> Void)] = [
        "changeSizeClicked" : ButtonsActions.changeSizeClicked,
    
    ]
    
    static let changeSizeClicked: (GKEntity) -> Void = { entity in
        if let node = entity.component(ofType: GKSKNodeComponent.self)?.node {
            node.run(.scale(to: 1.2, duration: 0.1)) {
                node.run(.scale(to: 1, duration: 0.1))
            }
        }
    }
    
}
