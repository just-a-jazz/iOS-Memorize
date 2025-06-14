//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jazz Siddiqui on 2025-05-29.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
