//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Color.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2022/01/25.
//

import SwiftUI

extension Color : ParsedView
{
    public typealias Content = Self
}

extension Color
{
    public static func parse(_ json: JSONParser) throws -> Content
    {
        if let _view = json["view"].string,
        
        _view == "Color"
        {
            if json["tag"].string == "rgba"
            {
                if let _red   = json["init"]["red"].double,
                   let _green = json["init"]["green"].double,
                   let _blue  = json["init"]["blue"].double,
                   let _alpha = json["init"]["alpha"].double
                {
                    print("SWIFTUI: Color -> init -> rgba")
                    
                    return Self(.sRGB, red: _red, green: _green, blue: _blue, opacity: _alpha)
                }
            }
            
            print(
                """
                    SWIFTUI: Color -> init -> invalid file or more than 1 initializer,
                    \(ViewModifierError.moreThanOneInitializer)
                """
            )
            
            return Self.primary
        }
        
        throw ViewError.failedToInitializeView
    }
}
