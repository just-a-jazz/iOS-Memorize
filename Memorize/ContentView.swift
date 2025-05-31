//
//  ContentView.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-05-29.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🍒", "🍓", "🍎", "🍉", "🍑", "🍋", "🍌", "🥝", "🥥", "🫐"]
    @State var cardsToShow = 4
    
    
    var body: some View {
        HStack {
            ForEach(0..<cardsToShow, id: \.self) { index in
                CardView(isFaceUp: true, content: emojis[index])
            }
        }
        .padding()
        HStack {
            cardAdjuster(by: -1, image: "rectangle.stack.badge.minus.fill")
            Spacer()
            cardAdjuster(by: +1, image: "rectangle.stack.badge.plus.fill")
        }
        .imageScale(.large)
        .font(.headline)
        .padding()
    }
    
    func cardAdjuster(by amount: Int, image: String) -> some View {
        Button(action: {
            cardsToShow += amount
        }, label: {
            Image(systemName: image)
        })
        .disabled(cardsToShow + amount < 1 || cardsToShow + amount > emojis.count)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let content: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 15)
        ZStack {
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                    .foregroundColor(.blue)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.foregroundColor(.blue)
            }
        }
        .onTapGesture {
            print(isFaceUp)
            isFaceUp.toggle()
            print(isFaceUp)
        }
    }
}

#Preview {
    ContentView()
}
