//
//  Button+Style.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/15.
//

import SwiftUI


extension Button
{
    public func modifyButton(_ json: JSONParser) -> some View
    {
        return ModifiedContent(
            content:  self,
            modifier: PrimitiveButtonModifier(parser: json)
        )
    }
    
}

public struct PrimitiveButtonModifier : ViewModifier
{
    public var parser: JSONParser
    
    public init(parser: JSONParser)
    {
        self.parser = parser
    }
    
    public func body(content: Content) -> some View
    {
        switch parser["style"].string
        {
        case "default":
            content
                .buttonStyle(DefaultButtonStyle())
            
        case "plain":
            content
                .buttonStyle(PlainButtonStyle())
            
        case "link":
            content
                .buttonStyle(LinkButtonStyle())
            
        case "bordered":
            content
                .buttonStyle(BorderedButtonStyle())
            
        case "borderless":
            content
                .buttonStyle(BorderlessButtonStyle())
            
        default:
            content
                .buttonStyle(BorderlessButtonStyle())
        }
    }
}
