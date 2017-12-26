//
//  GameViewController.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 10.12.2017.
//Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var gameView: GameView!
    
    let gameViewModel = GameViewModel()
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame()
    }
    
    // MARK: - Appearance
    
    func initGame() {
        guard let gameBoard = gameViewModel.gameBoard else {
            return
        }
        gameView.gameBoard = gameBoard
        
        for _ in 0...100 {
            let x = randLocation(dimension: .x, gameBoard: gameBoard), y = randLocation(dimension: .y, gameBoard: gameBoard)
            if let item = gameBoard[x, y] {
                item.state = .Alive
            }
        }
    }
    
    // MARK: - User Interaction
    
    @IBAction func startButtonClickHandler(_ sender: Any) {
        gameViewModel.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                                   selector: #selector(self.gameChangeState), userInfo: nil, repeats: true)
    }
    
    // MARK: - Additional Helpers
    
    fileprivate func randLocation (dimension: Dimension, gameBoard: GameBoard) -> Int {
        switch dimension {
        case .x:
            return Int(arc4random()) % gameBoard.dimensionsX
        case .y:
            return Int(arc4random()) % gameBoard.dimensionsY
        }
        
    }
    
    func gameChangeState() {
        gameViewModel.gameBoard?.calculateNewGameBoardState()
        gameView.setNeedsDisplay()
    }
    
}

// MARK: - GameViewControllerViewModelDelegate

extension GameViewController: GameViewModelDelegate {
    
}

