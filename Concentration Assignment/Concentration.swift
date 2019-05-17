//
//  Concentration.swift
//  Concentration Assignment
//
//  Created by Noha on 25.02.19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

struct Concentration {
    var cards = [Card]()
   // var chosenTheme: [String]
    //I need to make chooseGame make isMatched or not- we have two cases: 1- only one card is facedUp 2- two or none cards are facedUp
    var indexOfOneAndOnlyOne: Int?
    mutating func chooseGame(at index : Int){
        if !(cards[index].isMatched){
            if let matchedIndex = indexOfOneAndOnlyOne{
                if cards[index].identifier == cards[matchedIndex].identifier{
                cards[index].isMatched = true
                cards[matchedIndex].isMatched = true
                
            }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyOne = nil
                
            } else {
                for index in cards.indices{
                    cards[index].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyOne = index
            }
        }
    }
   /* init (numberOfPairsOfCards: Int, chosenTheme: [String]){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
        self.chosenTheme = chosenTheme
    }
    */
    init (numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
       
    }
    
}
