//
//  GameViewModel.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 10.12.2017.
//Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit
import SwifterSwift

protocol GameViewModelDelegate: class {
    
}

class GameViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    let gameViewTitle = "game_screen_title".localized
    
    // MARK: - View Model Data
    
    var gameBoard: GameBoard?
    var timer: Timer?
    
    weak var delegate: GameViewModelDelegate?
    
    // MARK: - Functions
    
    override init() {
        gameBoard = GameBoard()
    }
    
    func makeAliveCell(touchLocation: CGPoint, cellSize: CGSize) {
        guard let gameBoard = gameBoard else {
            return
        }
        let x = floor(touchLocation.x / cellSize.width).int
        let y = floor(touchLocation.y / cellSize.height).int
        if let item = gameBoard[x, y] {
            item.state = .Alive
        }
    }
    
    func aliveRandomCells() {
        guard let gameBoard = gameBoard else {
            return
        }
        for _ in 0...100 {
            let x = randLocation(dimension: .x, gameBoard: gameBoard), y = randLocation(dimension: .y, gameBoard: gameBoard)
            if let item = gameBoard[x, y] {
                item.state = .Alive
            }
        }
    }
    
    fileprivate func randLocation (dimension: Dimension, gameBoard: GameBoard) -> Int {
        switch dimension {
        case .x:
            return Int(arc4random()) % gameBoard.dimensionsX
        case .y:
            return Int(arc4random()) % gameBoard.dimensionsY
        }
    }
}


