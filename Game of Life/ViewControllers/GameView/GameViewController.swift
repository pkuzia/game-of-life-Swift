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
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    
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
        
        randomButton.backgroundColor = StyleKit.colorType(color: .blueColor)
        randomButton.layer.cornerRadius = randomButton.frame.width / 2
        randomButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        
        playButton.backgroundColor = StyleKit.colorType(color: .blueColor)
        playButton.layer.cornerRadius = randomButton.frame.width / 2
        playButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        photoButton.backgroundColor = StyleKit.colorType(color: .blueColor)
        photoButton.layer.cornerRadius = randomButton.frame.width / 2
        photoButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        playButton.tag = 0
        
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
    
    @IBAction func randomButtonClick(_ sender: Any) {
        gameViewModel.aliveRandomCells()
        gameView.setNeedsDisplay()
    }
    
    @IBAction func photoButtonClick(_ sender: Any) {
        
    }
    
    @IBAction func startButtonClick(_ sender: Any) {
        if playButton.tag == 0 {
            runTimer()
            playButton.tag = 1
        } else {
            gameViewModel.timer?.invalidate()
            playButton.tag = 0
        }
    }
    
    // MARK: - Additional Helpers
 
    fileprivate func runTimer() {
        gameViewModel.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                                   selector: #selector(self.gameChangeState), userInfo: nil, repeats: true)
    }
    
    func gameChangeState() {
        gameViewModel.gameBoard?.calculateNewGameBoardState()
        gameView.setNeedsDisplay()
    }
    
}

// MARK: - GameViewControllerViewModelDelegate

extension GameViewController: GameViewModelDelegate {
    
}

