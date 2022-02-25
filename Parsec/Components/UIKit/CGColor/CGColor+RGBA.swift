//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CGColor+RGBA.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

extension CGColor
{
    static let RGBA = "RGBA"
}

// swiftlint:disable type_name
public struct CGColor_RGBA
{
    let json: JSONParser
    
    public func parse() -> CGColor
    {
        debugPrint("UIKit: CGColor -> \(CGColor.RGBA) -> \(json)")
     
        // MARK: Create a color in the "Generic" RGB color space.
        
        guard let colorSpace = json["colorSpace"].string, colorSpace == CGColor.RGBA
        else
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.RGBA) -> not valid,
                    \(ViewModifierError.wrongInitializer)
                """
            )
            
            return CGColor.clear
        }
        
        if let _red   = json["red"].double,
           let _green = json["green"].double,
           let _blue  = json["blue"].double,
           let _alpha = json["alpha"].double
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.RGBA)
                    -> red:   \(_red),
                    -> green: \(_green),
                    -> blue:  \(_blue),
                    -> alpha: \(_alpha)
                """
            )
            
            return CGColor(
                red:   _red,
                green: _green,
                blue:  _blue,
                alpha: _alpha
            )
        }
        
        debugPrint(
            """
                UIKit: CGColor -> \(CGColor.RGBA) -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return CGColor.clear
    }
}
