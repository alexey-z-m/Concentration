//
//  ViewController.swift
//  Concentration
//
//  Created by Panda on 28.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    let buttonsEmoji = ["🦊","🦊","🐰","🐰"]
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            touches += 1
            flipButton(emoji: buttonsEmoji[buttonIndex], button: sender)
        }
    }
    
    @IBOutlet weak var touchlabel: UILabel!
}

