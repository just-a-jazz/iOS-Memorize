//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-05-29.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            cards
                .animation(.default, value: viewModel.cards)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
                    .opacity(card.isMatched ? 0 : 1)
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
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.foregroundColor(.blue).opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
