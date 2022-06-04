//
//  ConcentrationGame.swift
//  Contretion
//
//  Created by Эрик Нагаев on 15.12.2021.
//

import Foundation



//добавил что то

class ConcentrationGame {
    
    var cards = [Card]()
        
    var indexOfOneAndOnlyFaceUpCard: Int?
    
        func chooseCard(at index: Int) {
            if !cards[index].isMatched {
                if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                    if cards[matchingIndex].identifier == cards[index].identifier {
                        cards[matchingIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = nil
                } else {
                    for flipDown in cards.indices {
                        cards[flipDown].isFaceUp = false
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = index
                }
            }
        }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
    }
        
}
