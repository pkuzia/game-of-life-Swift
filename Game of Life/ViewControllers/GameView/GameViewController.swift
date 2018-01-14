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
    @IBOutlet weak var gameTitle: UILabel!
    
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
        initUI()
        initGame()
    }
    
    // MARK: - Appearance
    
    fileprivate func initUI() {
        view.backgroundColor = StyleKit.colorType(color: .gameViewBackgroundColor)
        gameView.backgroundColor = StyleKit.colorType(color: .gameViewBackgroundColor)
        gameTitle.attributedText = StyleKit.attributedText(text: gameViewModel.gameViewTitle, attribute: .gameTitle)
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.gameViewClick (_:)))
        gameView.addGestureRecognizer(gesture)
        
    }

    fileprivate func initGame() {
        guard let gameBoard = gameViewModel.gameBoard else {
            return
        }
        gameView.gameBoard = gameBoard
    }
    
    // MARK: - User Interaction
    
    func gameViewClick(_ sender: UITapGestureRecognizer){
        let touchLocation = sender.location(in: gameView)
        gameViewModel.makeAliveCell(touchLocation: touchLocation, cellSize: gameView.cellSize())
        gameView.setNeedsDisplay()
    }
    
    @IBAction func startButtonClickHandler(_ sender: Any) {
        gameViewModel.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                                   selector: #selector(self.gameChangeState), userInfo: nil, repeats: true)
    }
    
    // MARK: - Additional Helpers
 
    func gameChangeState() {
        gameViewModel.gameBoard?.calculateNewGameBoardState()
        gameView.setNeedsDisplay()
    }
    
}

// MARK: - GameViewControllerViewModelDelegate

extension GameViewController: GameViewModelDelegate {
    
}

