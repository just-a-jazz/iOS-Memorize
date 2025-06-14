//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-06-05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue } }
    }
    
    init(numberOfPairs: Int, contentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<max(2, numberOfPairs) {
            cards.append(Card(content: contentFactory(index), id: "\(index)a"))
            cards.append(Card(content: contentFactory(index), id: "\(index)b"))
        }
        cards.shuffle()
        
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp {
            if let indexOfOneAndOnlyFaceUpCard = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[indexOfOneAndOnlyFaceUpCard].content {
                    cards[chosenIndex].isMatched = true
                    cards[indexOfOneAndOnlyFaceUpCard].isMatched = true
                } else {
//                    self.indexOfOneAndOnlyFaceUpCard = nil
                }
            } else {
                self.indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    struct Card: Identifiable, CustomDebugStringConvertible, Equatable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(content): \(id) is \(isFaceUp ? "up" : "down") and \(isMatched ? "matched" : "not matched")" }
    }
    
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
