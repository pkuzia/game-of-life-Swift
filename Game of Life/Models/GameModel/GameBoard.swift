//
//  Cell.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 10.12.2017.
//  Copyright © 2017 pkuzia. All rights reserved.
//

import Foundation

enum Dimension {
    case x, y
}

class GameBoard {
    
    // MARK: - Variables
    
    var cells: [Cell]
    let dimensionsX: Int = 20
    let dimensionsY: Int = 25
    
    // MARK: - Functions
    
    public init() {
        cells = []
        
        for x in 0...dimensionsX - 1 {
            for y in 0...dimensionsY - 1 {
                cells.append(Cell(x: x, y: y))
            }
        }
    }
    
    subscript (x: Int, y: Int) -> Cell? {
        return cells.filter { $0.x == x && $0.y == y }.first
    }
    
    fileprivate func calculateNeighboursForCell(cell: Cell) -> [Cell] {
        return cells.filter({ iterateCell -> Bool in
            let positions = (abs(cell.x - iterateCell.x), abs(cell.y - iterateCell.y))
            switch positions {
            case (1,1), (1,0), (0,1):
                return true
            default:
                return false
            }
        })
    }
    
    func calculateNewGameBoardState() {
        
        let livingCells = cells.filter({ $0.state == .Alive })
        let deadCells = cells.filter({ $0.state == .Dead })
        
        let bornCells = deadCells.filter { cell -> Bool in
            return calculateNeighboursForCell(cell: cell).filter({ $0.state == .Alive }).count == 3
        }
        let dyingCells = livingCells.filter { cell -> Bool in
            let neighboursCell = calculateNeighboursForCell(cell: cell).filter({ $0.state == .Alive }).count
            return (neighboursCell > 3 || neighboursCell < 2)
        }
        
        bornCells.forEach({ $0.state = .Alive })
        dyingCells.forEach({ $0.state = .Dead })
    }
}
