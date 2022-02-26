//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  File.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public enum AnyFontTextStyleTags : String, CaseIterable
{
    case body
    case callout
    case caption1
    case caption2
    case footnote
    case headline
    case subheadline
    case largeTitle
    case title1
    case title2
    case title3
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

public struct AnyFontTextStyle
{
    @discardableResult
    // swiftlint:disable cyclomatic_complexity
    public func parse(
        _ modifier: JSONParser
    )
    -> NSFont.TextStyle?
    {
        guard let tag = modifier["font"].string else { return nil }
        
        switch AnyFontTextStyleTags(tag)
        {
        case .body:
            return NSFont.TextStyle.body
            
        case .callout:
            return NSFont.TextStyle.callout
            
        case .caption1:
            return NSFont.TextStyle.caption1
            
        case .caption2:
            return NSFont.TextStyle.caption2
            
        case .footnote:
            return NSFont.TextStyle.footnote
            
        case .headline:
            return NSFont.TextStyle.headline
            
        case .subheadline:
            return NSFont.TextStyle.subheadline
            
        case .largeTitle:
            return NSFont.TextStyle.largeTitle
            
        case .title1:
            return NSFont.TextStyle.title1
            
        case .title2:
            return NSFont.TextStyle.title2
            
        case .title3:
            return NSFont.TextStyle.title3
            
        default:
            return nil
        }
    }
}
