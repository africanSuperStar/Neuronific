//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSAttributedString+String.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/27.
//

import SwiftUI

public enum AnyNSAttributedStringTags : String, CaseIterable
{
    case rawString            = "RawString"
    case stringWithAttributes
    case attributedString
    case data
    case microsoftWord        = "MS_Word"
    case html
    case htmlBaseURL
    case htmlOptions
    case rtf
    case rtfd
    case rtfdFileWrapper
    case url
    case attachment
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

public struct AnyNSAttributedString
{
    @discardableResult
    // swiftlint:disable cyclomatic_complexity
    public func parse(
        _ modifier: JSONParser
    )
    -> NSMutableAttributedString?
    {
        guard let tag = modifier["init"]["type"].string else { return nil }
        
        switch AnyNSAttributedStringTags(tag)
        {
        case .rawString:
            return NSRawAttibutedString(json: modifier).parse()
            
//        case .stringWithAttributes:
//
//
//        case .attributedString:
//
//
//        case .data:
//
//
        case .microsoftWord:
            return NSMSWordAttibutedString(json: modifier).parse()
//
//        case .html:
//
//
//        case .htmlBaseURL:
//
//
//        case .htmlOptions:
//
//
//        case .rtf:
//
//
//        case .rtfd:
//
//
//        case .rtfdFileWrapper:
//
//
//        case .url:
//
//
//        case .attachment:
            
            
        default:
            return nil
        }
    }
}
