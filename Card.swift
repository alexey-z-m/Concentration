//
//  Card.swift
//  Concentration
//
//  Created by Panda on 05.05.2022.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var idNumber = 0
    
    static func idGenerator() -> Int {
        idNumber += 1
        return idNumber
    }
    
    init() {
        self.identifier = Card.idGenerator()
    }
}
