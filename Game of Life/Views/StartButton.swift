//
//  StartButton.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 18.01.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

enum ButtonState {
    case run, pause
}

class StartButton: UIButton {

    // MARK: - Variables
    
    var buttonState: ButtonState?
    
    // MARK: - Functions
    
    func changeState(to state: ButtonState) {
        guard let buttonState = buttonState else {
            return
        }
        switch buttonState {
        case .pause:
            self.setImageForAllStates(UIImage(named: "pause")!)
            self.buttonState = .run
        case .run:
            self.setImageForAllStates(UIImage(named: "play")!)
            self.buttonState = .pause
        }
    }
}
