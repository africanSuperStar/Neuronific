//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CGColor+sRGB.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

extension CGColor
{
    static let S_RGB = "sRGB"
}

// swiftlint:disable type_name
public struct CGColor_sRGB
{
    let json: JSONParser
    
    public func parse() -> CGColor
    {
        debugPrint("UIKit: CGColor -> \(CGColor.S_RGB) -> \(json)")
     
        // MARK: Create a color in the "Generic" CMYK color space.

        guard let colorSpace = json["colorSpace"].string, colorSpace == CGColor.S_RGB
        else
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.S_RGB) -> not valid,
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
                    UIKit: CGColor -> \(CGColor.S_RGB)
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
                UIKit: CGColor -> \(CGColor.S_RGB) -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return CGColor.clear
    }
}
