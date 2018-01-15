//
//  StyleKit.swift
//  Game of Life
//
//  Created by Przemysław Kuzia on 7/29/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

public enum Attribute {
    case gameTitle, menuButton
}

public enum Color {
    case blueColor, blueBackgroundColor, gameViewBackgroundColor
}


class StyleKit {
    
    // swiftlint:disable cyclomatic_complexity
    
    static func attributedText(text: String, attribute: Attribute) -> NSAttributedString {
        var attributedDictionary = [String: AnyObject]()
        switch attribute {
        case .menuButton:
            attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 17 , weight: UIFontWeightLight))
        case .gameTitle:
            attributedDictionary = attributedText(color: colorType(color: .blueColor), font: UIFont(name: "Courier New", size: 24)!)
        }
        return NSAttributedString(string: text, attributes: attributedDictionary)
    }
    
    static func colorType(color: Color) -> UIColor {
        switch color {
        case .blueColor:
            return UIColor(hexString: "#52B9D3")!
        case .gameViewBackgroundColor:
            return UIColor(hexString: "#273C47")!
        case .blueBackgroundColor:
            return UIColor(hexString: "#3E5764")!
        }
    }
    
    static func attributedText(color: UIColor, font: UIFont, alignment: NSTextAlignment = .left, underline: Bool = false) -> [String: AnyObject] {
        var attributedText = [String: AnyObject]()
        attributedText[NSForegroundColorAttributeName] = color
        attributedText[NSFontAttributeName] = font
        if underline {
            attributedText[NSUnderlineStyleAttributeName] = NSUnderlineStyle.styleSingle.rawValue as AnyObject
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3.5
        paragraphStyle.alignment = alignment
        
        attributedText[NSParagraphStyleAttributeName] = paragraphStyle
        
        return attributedText
    }
}
