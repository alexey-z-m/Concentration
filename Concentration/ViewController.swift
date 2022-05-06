//
//  ViewController.swift
//  Concentration
//
//  Created by Panda on 28.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet{
            touchlabel.text = "Touches: \(touches)"
        }
    }
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.backgroundColor = #colorLiteral(red: 0.07526155561, green: 0.4578902721, blue: 0.8260596395, alpha: 1)
            button.setTitle("", for: .normal)
        } else {
            button.titleLabel?.font = .systemFont(ofSize: 90)
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    var emojiCollection = ["🦊","🐰","🐵","🐼","🐯","🐸","🐥","🐠"]
    var emojiDictionaty = [Int:String]()
    
    func emojiIdentifier (for card: Card) -> String {
        if emojiDictionaty[card.identifier] == nil {
            let rndIndex = Int.random(in: emojiCollection.indices)
            emojiDictionaty[card.identifier] = emojiCollection.remove(at: rndIndex)
        }
        return emojiDictionaty[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                //button.titleLabel?.font = .systemFont(ofSize: 90)
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                button.setTitle("", for: .normal)
            }
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            touches += 1
            //flipButton(emoji: buttonsEmoji[buttonIndex], button: sender)
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    @IBOutlet weak var touchlabel: UILabel!
}

