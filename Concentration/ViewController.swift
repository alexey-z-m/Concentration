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
            
            button.setTitle(emoji, for: .normal)
            button.titleLabel?.font = UIFont(name: button.titleLabel?.font.fontName ?? "", size: 90)
            button.backgroundColor = UIColor.white
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        flipButton(emoji: "🦊", button: sender)
    }
    
    @IBOutlet weak var touchlabel: UILabel!
}

