//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-05-29.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(0..<viewModel.cards.count, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 15)
        ZStack {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                    .foregroundColor(.blue)
                Text(card.content)
                    .font(.largeTitle)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.foregroundColor(.blue).opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
