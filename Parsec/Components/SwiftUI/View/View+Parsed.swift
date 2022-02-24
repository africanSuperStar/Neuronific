//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  View+Parsed.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2022/01/01.
//

import SwiftUI

public enum ViewTags : String, CaseIterable
{
    case text   = "Text"
    case button = "Button"
    case color  = "Color"
    
    init?(_ view: String)
    {
        self.init(rawValue: view)
    }
}

extension AnyView
{
    @discardableResult
    public static func parse(_ json: JSONParser) throws -> Self
    {
        guard let view = json["view"].string
        else
        {
            return Self(EmptyView())
        }
        
        switch ViewTags(view)
        {
        case .text:
            return Self(
                try Text.parse(json)
                    .modify(json)
                    .layer(json)
            )
            
        case .button:
            return Self(
                try Button.parseLabel(json)
                    .modify(json)
                    .layer(json)
            )
            
        case .color:
            return Self(
                try Color.parse(json)
                    .modify(json)
                    .layer(json)
            )
        
        default:
            return Self(
                EmptyView()
            )
        }
    }
}