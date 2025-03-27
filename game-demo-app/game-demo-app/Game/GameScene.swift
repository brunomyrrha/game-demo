//
//  GameScene.swift
//  game-demo-app
//
//  Created by Bruno Diniz on 27/03/2025.
//

import SpriteKit
import Combine

final class GameScene: SKScene, ObservableObject {
    private var deltaTime: TimeInterval = .zero
    private var lastTime: TimeInterval = .zero
   
    override func update(_ currentTime: TimeInterval) {
        updateDeltaTime(currentTime)
    }
    
    override func didMove(to view: SKView?) {
        backgroundColor = .clear
        view?.allowsTransparency = true
        
        setUp()
    }
    
    // MARK: - Private methods
    
    private func setUp() {
        scaleMode = .aspectFill
        physicsWorld.gravity = .zero
    }
    
    private func updateDeltaTime(_ currentTime: TimeInterval) {
        if lastTime.isZero {
            lastTime = currentTime
        }
        
        deltaTime = currentTime - lastTime
        lastTime = currentTime
    }
}
