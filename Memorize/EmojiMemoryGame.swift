//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-06-05.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🍒", "🍓", "🍎", "🍉", "🍑", "🍋", "🍌", "🥝", "🥥", "🫐"]
    
    @Published private var model = MemoryGame(numberOfPairs: 6) { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "❓"
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
