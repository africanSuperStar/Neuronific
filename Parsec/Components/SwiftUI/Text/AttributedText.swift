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
        var attributedString = NSMutableAttributedString()
        
        if let _view = json["view"].string,
        
        _view == "AttributedText"
        {
            let initializerCount = [
                json["init"]["content"].string != nil,
                json["init"]["localizedStringKey"].string != nil
            ]
            
            if initializerCount.filter({ $0 == true }).count != 1
            {
                print("SWIFTUI: Text -> init -> more than 1 initializer")
            }
            
            if let _content = json["init"]["content"].string, !_content.isEmpty
            {
                print("SWIFTUI: Text -> init -> content -> \(_content)")
                
                attributedString = NSMutableAttributedString(string: _content)
            }
            
            if let _key = json["init"]["localizedStringKey"].string, !_key.isEmpty
            {
                print("SWIFTUI: Text -> init -> localizedStringKey -> \(_key)")
    
                attributedString = NSMutableAttributedString(string: LocalizedString(_key))
            }
        }
        
        guard let attributes = json["stringAttributes"].array
        else
        {
            return AnyView(EmptyView())
        }
        
        for attribute in attributes
        {
            parse(attribute, attributedString: attributedString)
        }
        
        let view = NSAttributedStringView(attributedString)
        
        return AnyView(
            view
        )
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