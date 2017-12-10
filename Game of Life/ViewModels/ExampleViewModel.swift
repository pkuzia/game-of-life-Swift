//
//  ExampleViewModel.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 12/10/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import UIKit

protocol ExampleViewModelDelegate: class {
    
}

class ExampleViewModel: BaseViewModel {
    
    weak var delegate: ExampleViewModelDelegate?
}
