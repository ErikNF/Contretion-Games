//
//  ViewController.swift
//  Contretion
//
//  Created by Эрик Нагаев on 13.12.2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = ConcentrationGame(numberOfPairsOfCards:(buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    var emojiCollection = ["🦐","🐂","🐄","🐎","🐐","🦤","🦙","🦃","🐈‍⬛","🪶","🐑","🦒"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentefier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentefier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.006242695265, green: 0.4581466317, blue: 0.8921137452, alpha: 1)
            }
        }
    }
    
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender)  {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
            }
        
    }
    


}
