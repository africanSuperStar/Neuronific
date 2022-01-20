//
//  Padding.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/27.
//

import SwiftUI


public struct Padding : JSONModifier, ViewModifier
{
    let json: JSONParser
    
    public func body(content: Content) -> some View
    {
        padding(json, content: content)
    }
    
    @ViewBuilder
    public func padding(_ json: JSONParser, content: Content) -> some View
    {
        self.parse(json, content: content)
    }
    
    @discardableResult
    public func parse(_ json: JSONParser, content: Content) -> some View
    {
        debugPrint("SWIFTUI: ViewModifier -> Padding -> \(json)")
        
        if let _value = json["value"].double
        {
            debugPrint("SWIFTUI: ViewModifier -> Padding -> value: \(_value)")
            
            return content.padding(_value)
        }

        debugPrint("SWIFTUI: Padding -> init -> not valid or more than one initializer, \(ViewModifierError.moreThanOneInitializer)")

        return content.padding(.zero)
    }
    
}
