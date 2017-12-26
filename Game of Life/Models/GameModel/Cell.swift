//
//  Cell.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 10.12.2017.
//  Copyright © 2017 pkuzia. All rights reserved.
//

import Foundation

enum State {
    case Alive, Dead
}

class Cell {
    
    // MARK: - Variables
    
    let x: Int
    let y: Int
    var state: State
    
    // MARK: - Functions
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
        state = .Dead
    }
}
