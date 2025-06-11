//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-06-05.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: [Card]
    
    init(numberOfPairs: Int, contentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<max(2, numberOfPairs) {
            cards.append(Card(content: contentFactory(index)))
            cards.append(Card(content: contentFactory(index)))
        }
        
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
    
}
