//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyNSTextContainer.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/27.
//

import SwiftUI

public enum NSTextViewTags : String, CaseIterable
{
    case textView = "NSTextView"
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

extension Text
{
    @ViewBuilder
    public static func textView(_ json: JSONParser) -> some View
    {
        AnyTextView(json: json)
    }
}

public struct AnyTextView : View
{
    let json: JSONParser
 
    public var body: some View
    {
        parse(json)
    }
    
    @discardableResult
    public func parse(_ json: JSONParser) -> AnyView
    {
        guard var textStorage = try? NSLayoutManager.parse(json)
        else
        {
           debugPrint(
               """
                   UIKit: TextKit -> NSLayoutManager -> not valid or more than one initializer,
                   \(ParsedObjectError.failedToInitializeObject)
               """
           )
            
            return AnyView(
                EmptyView()
            )
        }
        
        guard var layoutManager = try? NSLayoutManager.parse(json)
        else
        {
           debugPrint(
               """
                   UIKit: TextKit -> NSLayoutManager -> not valid or more than one initializer,
                   \(ParsedObjectError.failedToInitializeObject)
               """
           )
            
            return AnyView(
                EmptyView()
            )
        }
    
        let textContainer = NSTextContainer()
        textContainer.widthTracksTextView  = true
        textContainer.heightTracksTextView = true
        textContainer.lineBreakMode        = .byTruncatingTail

        layoutManager.addTextContainer(textContainer)
        
//        textStorage.addLayoutManager(layoutManager)
        
        return AnyView(EmptyView())
    }
}
