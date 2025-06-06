//
//  ContentView.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-05-29.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🍒", "🍓", "🍎", "🍉", "🍑", "🍋", "🍌", "🥝", "🥥", "🫐"]
    
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(isFaceUp: true, content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let content: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 15)
        ZStack {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                    .foregroundColor(.blue)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.foregroundColor(.blue).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
