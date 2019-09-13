//
//  SKPhysicsMask.swift
//  SKButtonNode
//
//  Created by Victor Vasconcelos on 11/09/19.
//  Copyright © 2019 Behind Game Lab. All rights reserved.
//

import Foundation
import SpriteKit

import SpriteKit

extension UInt32 {
    static let base:    UInt32 = 0b1
    static let player:  UInt32 = .base << 0 // 1
    static let enemy:   UInt32 = .base << 1 // 2
    static let floor:   UInt32 = .base << 2 // 4
    static let wall:    UInt32 = .base << 3 // 8
    
    static let allMasks: [UInt32] = [
        .player,
        .enemy,
        .floor,
        .wall
    ]
    
    static func contactWithAllCategories(less: [UInt32] = []) -> UInt32 {
        var result: UInt32 = 0b00
        
        for category in UInt32.allMasks {
            if !less.contains(category) {
                result |= category
            }
        }
        
        return result
    }
}


// 0001
// 0010
// 0100
// 1000
// 0011 = 3

/*
 
 
        Para detectar colisão precisamos de algumas coisas,
        - primeiro definir qual será a "categoryMask" do corpo físico
        - segundo definir qual será a "colissionMask" do corpo físico
 
        Essas masks são UInt32, e para detectarmos se ouve ou não colisão
        o sistema interno do SpriteKit cálcula um operação AND bit a bit
        entre a categoryMask do corpo A e colisionMask do corpo B e vice versa
 
        Exemplo:
 
        BodyA                           BodyB
 
        CategoryMask:   0b001 // 1      Category :      0b010 // 2
        CollisionMask:  0b001 // 1      Collision:      0b010 // 2
        ContactMask:    0b001 // 1      ContactMask:    0b010 // 2
 
        Internamente o Sprikite irá verificar
 
        0b001 ~> Category A
        ||||| AND
        0b010 ~> Collision B
        -----
        0b000 ~> Resultado do AND bit a bit
 
        Se esse resultado for diferente de 0, logo teremos contato
        Nesse caso não teríamos contato
 
        Mas supondo que a CollisionMask de B fosse 0b001 (1), então
 
        0b001 ~> Category A
        ||||| AND
        0b001 ~> Collision B
        -----
        0b001 ~> Resultado do AND bit a bit
 
        Nesse caso o resultado é 1 que é diferente de 0, logo há colisão
 
        Para o cálculo de contato é utilizado a mesma lógica,
        porém entre o contactMask e a categoryMask
 
 
 */
