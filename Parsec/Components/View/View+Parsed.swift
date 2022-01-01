//
//  AnyView.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2022/01/01.
//

import SwiftUI


public enum ViewTags : String, CaseIterable
{
    case text = "Text"
    
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
                try Text.parse(json).modify(json)
            )
        
        default:
            return Self(
                EmptyView()
            )
        }
    }
}
