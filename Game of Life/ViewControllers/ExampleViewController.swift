//
//  ExampleViewController.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 12/10/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import UIKit

class ExampleViewController: BaseViewController {
    
    // MARK: - Outlets
    
    var exampleViewModel = ExampleViewModel()
    
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
    }

    // MARK: - Appearance
    
    func initUI() {

    }
    
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers
    
}

// MARK: - ExampleViewModelDelegate

extension ExampleViewController: ExampleViewModelDelegate {
    
}
