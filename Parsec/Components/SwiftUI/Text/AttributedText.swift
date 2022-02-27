//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ModifiedNSAttributedString.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public enum NSAttributedStringModifierTags : String, CaseIterable
{
    case dynamicFont = "NSDynamicAttributedFont"
    case font        = "NSCustomAttributedFont"
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

extension Text
{
    @ViewBuilder
    public static func attributedString(_ json: JSONParser) -> some View
    {
        AnyViewNSAttributedString(json: json)
    }
}

public struct AnyViewNSAttributedString : View
{
    let json: JSONParser
 
    public var body: some View
    {
        anyStringAttributes(json)
    }
    
    @discardableResult
    public func anyStringAttributes(_ json: JSONParser) -> AnyView
    {
        if let tag = json["view"].string,
        
        tag == "AttributedText"
        {
            guard let attributedString = AnyNSAttributedString().parse(json)
            else
            {
                return AnyView(EmptyView())
            }

            let view = NSAttributedStringView(attributedString)
            
            guard let attributes = json["stringAttributes"].array
            else
            {
                return AnyView(view)
            }
            
            for attribute in attributes
            {
                parse(attribute, attributedString: attributedString)
            }
            
            return AnyView(
                view
            )
        }
        
        return AnyView(EmptyView())
    }
}

extension AnyViewNSAttributedString
{
    public func parse(
        _ modifier:       JSONParser,
        attributedString: NSMutableAttributedString
    ) {
        guard let tag = modifier["tag"].string else { return }
        
        switch NSAttributedStringModifierTags(tag)
        {
        case .dynamicFont:
            NSDynamicAttibutedFont(json: modifier, attributedString: attributedString).parse()
    
        case .font:
            NSCustomAttibutedFont(json: modifier, attributedString: attributedString).parse()
    
        default:
            return
        }
    }
}
