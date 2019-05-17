//
//  ViewController.swift
//  Concentration Assignment
//
//  Created by Noha on 25.02.19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    lazy var game = Concentration(numberOfPairsOfCards: (buttons.count + 1)/2)//, chosenTheme: themePicker() 
    
    
    //touch card flips UpdateModelFromView: flipping , chooseGame:Matching
    var flipCard = 0 {
        didSet {
            flipCardLabel.text = " Flip Count : \(flipCard)"
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard += 1
        if let cardNumber = buttons.index(of:sender){
        game.chooseGame(at: cardNumber)
        updateModelFromView()
        
        } else {
            print("Choosen Card is not in the array")
        }
    }
    
    @IBOutlet var buttons: [UIButton]!
    
    
    /*var emojiChoices = ["🎃","👻","😱","🦇","😈"]
    var emoji = [Int : String ]()
    func emoji(for card : Card)-> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0{
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
            //instead of this answer we need to remove the emoji from array not to use it again never!    emoji[card.identifier] =  emojiChoices[randomIndex]
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }*/
    
    //how to load the chosen array only once ! ?
    
    var emojiChoices = ["HalloweenTheme" : ["🎃","👻","😱","🦇","😈","🍬"], "SportTheme" : ["⚽️","🥊","🏊‍♀️","🏑","🚴‍♀️","🏋️‍♂️"], "FoodTheme":["🥐","🍕","🌶","🌮","🌭","🧀"], "AnimalTheme": ["🦓","🦒","🦔","🦢","🦜","🦖"] ]
    
    //var choosenTheme = [String]()
    var emoji = [Int: String]()
   
    func themePicker()-> String{
        let emojikey = Array(emojiChoices.keys)
        let randomKeyIndex = Int (arc4random_uniform(UInt32(emojikey.count)))
    
        let choosenKey = emojikey[randomKeyIndex]
        //let choosenTheme = emojiChoices[choosenKey]
        
        return choosenKey
    }
    
    
    func emoji(for card: Card)-> String{
        //let emojikey = Array(emojiChoices.keys)
        //let randomKeyIndex = Int (arc4random_uniform(UInt32(emojikey.count)))
       // let choosenKey = emojikey[randomKeyIndex]
        //var choosenTheme = emojiChoices[choosenKey]
        
        
       // var currentTheme = game.chosenTheme
        let currentKeyTheme = themePicker()
        if emoji[card.identifier] == nil, currentKeyTheme != nil {
           // let randomIndex = Int(arc4random_uniform(UInt32(currentTheme.count)))
        //emoji[card.identifier] = currentTheme.remove(at: randomIndex)
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices[currentKeyTheme]!.count)))
                emoji[card.identifier] = emojiChoices[currentKeyTheme]?.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func updateModelFromView(){
        
        for index in buttons.indices{
            let button = buttons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                
                
            } else{
                
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                button.setTitle(nil, for: UIControl.State.normal)
                
            }
        }
    }
    @IBOutlet weak var flipCardLabel: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBAction func newGame(_ sender: UIButton)  {
        flipCard = 0
        for index in game.cards.indices{
            game.cards[index].isFacedUp = false
            game.cards[index].isMatched = false
            updateModelFromView()
        }
    
    }
    
}


