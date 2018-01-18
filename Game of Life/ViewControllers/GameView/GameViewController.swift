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
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var startButton: StartButton!
    
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
        
        startButton.backgroundColor = StyleKit.colorType(color: .blueColor)
        startButton.layer.cornerRadius = randomButton.frame.width / 2
        startButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        startButton.buttonState = .pause
        
        photoButton.backgroundColor = StyleKit.colorType(color: .blueColor)
        photoButton.layer.cornerRadius = randomButton.frame.width / 2
        photoButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        
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
        savePhotoGameView()
    }
    
    @IBAction func startButtonClick(_ sender: Any) {
        guard let state = startButton.buttonState else {
            return
        }
        switch state {
        case .run:
            startButton.changeState(to: .pause)
            gameViewModel.timer?.invalidate()
        case .pause:
            startButton.changeState(to: .run)
            runTimer()
        }
    }
    
    // MARK: - Additional Helpers
 
    fileprivate func savePhotoGameView() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: gameView.size.width + 18, height: gameView.size.height), true, 0.0)
        if let currentContext = UIGraphicsGetCurrentContext() {
            gameView.layer.render(in: currentContext)
            if let gameViewImage = UIGraphicsGetImageFromCurrentImageContext() {
                UIImageWriteToSavedPhotosAlbum(gameViewImage, nil, nil, nil)
            }
            UIGraphicsEndImageContext()
        }
    }
    
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
