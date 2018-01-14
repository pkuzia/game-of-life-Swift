//
//  GameView.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 11.12.2017.
//  Copyright © 2017 pkuzia. All rights reserved.
//

import Foundation
import UIKit

class GameView: UIView {
    
    // MARK: - Variables
    
    var gameBoard: GameBoard?
    let margin: CGFloat = 1.0
    
    // MARK: - Functions
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext(), let gameBoard = gameBoard else {
            return
        }
        for cell in gameBoard.cells {
            context.setFillColor(fillColorForCell(state: cell.state).cgColor)
            context.addRect(frameForCell(cell: cell))
            context.fillPath()
        }
    }
    
    func cellSize() -> CGSize {
        guard let gameBoard = gameBoard else {
            return CGSize()
        }
        let dimensions = CGFloat(gameBoard.dimensionsX)
        return CGSize(width: self.bounds.width / dimensions - margin, height: self.bounds.width / dimensions - margin)
    }
    
    fileprivate func frameForCell (cell: Cell) -> CGRect {
        guard let gameBoard = gameBoard else {
            return CGRect()
        }
        
        let dimensions = CGFloat(gameBoard.dimensionsX)
        let cellSize = CGSize(width: self.bounds.width / dimensions - margin, height: self.bounds.width / dimensions - margin)
        let x = CGFloat(cell.x) * cellSize.width + CGFloat(cell.x) * margin
        let y = CGFloat(cell.y) * cellSize.height + CGFloat(cell.y) * margin
        return CGRect(x: x, y: y, width: cellSize.width, height: cellSize.height)
    }
    
    fileprivate func fillColorForCell (state: State) -> UIColor {
        switch state {
        case .Alive:
            return StyleKit.colorType(color: .blueColor)
        case .Dead:
            return StyleKit.colorType(color: .blueBackgroundColor)
        }
    }
}
