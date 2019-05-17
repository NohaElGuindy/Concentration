//
//  Card.swift
//  Concentration Assignment
//
//  Created by Noha on 25.02.19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation
struct Card {
    
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var  uniqueIdentifier = 0
    static func getUniqueIdentifier()-> Int{
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    init(){
        identifier = Card.getUniqueIdentifier()
    }
    
}
