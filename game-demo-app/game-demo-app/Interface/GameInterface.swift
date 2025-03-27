//
//  GameInterface.swift
//  game-demo-app
//
//  Created by Bruno Diniz on 27/03/2025.
//

import RiveRuntime
import Combine

final class GameInterface: ObservableObject {
    enum Controller {
        case left, right
        
        var riveID: String {
            switch self {
            case .left:
                return "tapLeft"
            case .right:
                return "tapRight"
            }
        }
    }
    
    @Published private(set) var bg: RiveViewModel
    @Published private(set) var ui: RiveViewModel
    
    init () {
        bg = RiveViewModel(fileName: "drumgame", artboardName: "BG")
        ui = RiveViewModel(fileName: "drumgame", artboardName: "UI")
        
        bg.fit = .fill
        ui.fit = .fitWidth
    }
    
    func didTap(x: CGFloat) {
        let control = x > 500 ? Controller.right : .left
        ui.triggerInput(control.riveID)
        debugPrint("🎮", control.riveID)
    }
}
