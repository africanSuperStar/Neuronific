//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyNSTextView.swift
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
//        guard let textStorage = try? NSTextStorage.parse(json)
//        else
//        {
//           debugPrint(
//               """
//                   UIKit: TextKit -> NSLayoutManager -> not valid or more than one initializer,
//                   \(ParsedObjectError.failedToInitializeObject)
//               """
//           )
//
//            return AnyView(
//                EmptyView()
//            )
//        }
//
//        guard let layoutManager = try? NSLayoutManager.parse(json)
//        else
//        {
//           debugPrint(
//               """
//                   UIKit: TextKit -> NSLayoutManager -> not valid or more than one initializer,
//                   \(ParsedObjectError.failedToInitializeObject)
//               """
//           )
//
//            return AnyView(
//                EmptyView()
//            )
//        }
        
        let textStorage   = NSTextStorage(string: "Hello, World!")
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: .init(width: 20.0, height: 20.0))
        
        textContainer.widthTracksTextView  = true
        textContainer.heightTracksTextView = true
        textContainer.lineBreakMode        = .byTruncatingTail
        textContainer.textView?.backgroundColor = .red
        
        layoutManager.addTextContainer(textContainer)

        textStorage.addLayoutManager(layoutManager)

        let textView = NSTextViewRepresentable(textContainer)
        
        return AnyView(textView)
    }
}
