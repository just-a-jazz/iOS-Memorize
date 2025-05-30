//
//  ContentView.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-05-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                CardView(isFaceUp: true)
                CardView()
                CardView()
                CardView(isFaceUp: true)
            }
            HStack {
                CardView()
                CardView()
                CardView()
                CardView(isFaceUp: true)
            }
            HStack {
                CardView()
                CardView(isFaceUp: true)
                CardView()
                CardView(isFaceUp: true)
            }
            HStack {
                CardView()
                CardView()
                CardView()
                CardView(isFaceUp: true)
            }
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp = false
    
    var body: some View {
        if isFaceUp {
            getCardPreview()
        } else {
            getCardTop()
        }
    }
    
    func getCardTop() -> some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.blue)
    }
    
    func getCardPreview() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(lineWidth: 6)
                .foregroundColor(.blue)
            Text("🍻")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
