//
//  GameViewModel.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 10.12.2017.
//Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit

protocol GameViewModelDelegate: class {
    
}

class GameViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    // MARK: - View Model Data
    
    var gameBoard: GameBoard?
    var timer: Timer?
    
    weak var delegate: GameViewModelDelegate?
    
    // MARK: - Functions
    
    override init() {
       gameBoard = GameBoard()
    }
}


