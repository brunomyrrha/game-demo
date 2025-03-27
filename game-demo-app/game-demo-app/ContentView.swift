//
//  ContentView.swift
//  game-demo-app
//
//  Created by Bruno Diniz on 27/03/2025.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject private var gameScene = GameScene()
    @StateObject private var gameInterface = GameInterface()
    
    var body: some View {
        ZStack {
            gameInterface
                .bg
                .view()
                .zIndex(0.0)
                .ignoresSafeArea()
            
            gameInterface
                .ui
                .view()
                .zIndex(1.0)
                        
            SpriteView(
                scene: gameScene,
                preferredFramesPerSecond: 120,
                options: [.allowsTransparency],
                debugOptions: []
            )
            .ignoresSafeArea()
            .zIndex(0.5)
        }
        .onTapGesture {
            gameInterface.didTap(x: $0.x)
        }
    }
}

#Preview {
    ContentView()
}
