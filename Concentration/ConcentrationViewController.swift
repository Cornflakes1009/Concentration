//
//  ConcentrationViewController.swift
//  Concentration
//
//  Created by HaroldDavidson on 6/9/19.
//  Copyright © 2019 HaroldDavidson. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    // lazy means it won't initialize until something goes to use it. Cannot have a properrty observer (didSet)
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // TODO: create a reset game button
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        // TODO: fix - currently incrementing value even if card has already been matched. Boooo!
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else {
            print("chosen card was not in card buttons collection")
        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🙀","🎃","🦇","👹", "👻", "😱", "🍭", "🍬", "🍎"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?" // if not nil, returning value. Else returning "?"
    }
}

