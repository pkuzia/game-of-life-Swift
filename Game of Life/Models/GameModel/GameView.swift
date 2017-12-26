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
    
    // MARK: - Functions
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext(), let gameBoard = gameBoard else {
            return
        }
        
        func fillColorForCell (state: State) -> UIColor {
            switch state {
            case .Alive:
                return UIColor.blue
            case .Dead:
                return UIColor.lightGray
            }
        }
        
        func frameForCell (cell: Cell) -> CGRect {
            let dimensions = CGFloat(gameBoard.dimensionsX)
            let cellSize = CGSize(width: self.bounds.width / dimensions, height: self.bounds.width / dimensions)
            return CGRect(x: CGFloat(cell.x) * cellSize.width, y: CGFloat(cell.y) * cellSize.height, width: cellSize.width, height: cellSize.height)
        }
        
        for cell in gameBoard.cells {
            context.setFillColor(fillColorForCell(state: cell.state).cgColor)
            context.addRect(frameForCell(cell: cell))
            context.fillPath()
        }
    }
}
