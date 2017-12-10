//
//  String.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 12/10/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
