//
//  Card.swift
//  Concentration
//
//  Created by HaroldDavidson on 6/9/19.
//  Copyright © 2019 HaroldDavidson. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0 // static variable only used inside of the Card class
    
    static func getUniqueIdentifier() -> Int { // static function can't be sent to a card. It can only be used in Card itself. No instances of Card can use it.
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
