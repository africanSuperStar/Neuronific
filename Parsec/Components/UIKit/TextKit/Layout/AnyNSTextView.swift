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
        let textView = NSTextViewRepresentable(
            font: .userFixedPitchFont(ofSize: 14),
            parser: json
        )
        
        return AnyView(textView)
    }
}
