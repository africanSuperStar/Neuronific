//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ThumbnailBackgroundStyle.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/21.
//

import AppKit

enum ThumbnailBackgroundStyle : CaseIterable, RawRepresentable
{
    typealias RawValue = Int

    typealias AllCases = [ThumbnailBackgroundStyle]

    static let allCases: [ThumbnailBackgroundStyle] = [
        strong,
        medium,
        systemBackground
    ]

    case strong
    case medium
    case systemBackground
    case custom(NSColor)

    init ? (rawValue: Int)
    {
        switch rawValue
        {
        case  0:
            self = .strong
        
        case  1:
            self = .medium
        
        case  2:
            self = .systemBackground
        
        default:
            return nil
        }
    }

    var rawValue: Int
    {
        switch self
        {
        case .strong:
            return 0
        
        case .medium:
            return 1
        
        case .systemBackground:
            return 2
        
        case .custom:
            return -1
        }
    }

//    var color: NSColor
//    {
//        switch (self, Inspector.configuration.colorStyle)
//        {
//        case (.strong, .dark):
//            return NSColor(white: 0.40, alpha: 1)
//
//        case (.medium, .dark):
//            return NSColor(white: 0.80, alpha: 1)
//
//        case (.systemBackground, .dark):
//            return NSColor(white: 0, alpha: 1)
//
//        case (.strong, .light):
//            return NSColor(white: 0.40, alpha: 1)
//
//        case (.medium, .light):
//            return NSColor(white: 0.80, alpha: 1)
//
//        case (.systemBackground, .light):
//            return NSColor(white: 1, alpha: 1)
//
//        case let (.custom(color), _):
//            return color
//        }
//    }
//
//    var contrastingColor: NSColor
//    {
//        switch (self, Inspector.configuration.colorStyle)
//        {
//        case (.strong, .dark):
//            return .darkText
//
//        case (.medium, .dark):
//            return .white
//
//        case (.systemBackground, .dark):
//            return .lightGray
//
//        case (.strong, .light):
//            return .white
//
//        case (.medium, .light):
//            return .darkText
//
//        case (.systemBackground, .light):
//            return .darkText
//
//        case let (.custom(color), _):
//            return color.contrasting
//        }
//    }

//    var image: NSImage
//    {
//        switch self
//        {
//        case .strong:
//            return IconKit.imageOfAppearanceLight().withRenderingMode(.alwaysTemplate)
//
//        case .custom, .medium:
//            return IconKit.imageOfAppearanceMedium().withRenderingMode(.alwaysTemplate)
//
//        case .systemBackground:
//            return IconKit.imageOfAppearanceDark().withRenderingMode(.alwaysTemplate)
//        }
//    }
}
