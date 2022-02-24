//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CGColor+CMYK.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

extension CGColor
{
    static let CYMK = "CYMK"
}

public struct CGColor_CMYK
{
    let json: JSONParser
    
    public func parse() -> CGColor
    {
        debugPrint("UIKit: CGColor -> \(CGColor.CYMK) -> \(json)")
     
        // MARK: Create a color in the "Generic" CMYK color space.

        guard let colorSpace = json["colorSpace"].string, colorSpace == CGColor.CYMK
        else
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.CYMK) -> not valid,
                    \(ViewModifierError.wrongInitializer)
                """
            )
            
            return CGColor.clear
        }
        
        if let _cyan    = json["cyan"].double,
           let _magenta = json["magenta"].double,
           let _yellow  = json["yellow"].double,
           let _black   = json["black"].double,
           let _alpha   = json["alpha"].double
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.CYMK)
                    -> cyan:    \(_cyan),
                    -> magenta: \(_magenta),
                    -> yellow:  \(_yellow),
                    -> black:   \(_black),
                    -> alpha:   \(_alpha)
                """
            )
            
            return CGColor(
                genericCMYKCyan: _cyan,
                magenta:         _magenta,
                yellow:          _yellow,
                black:           _black,
                alpha:           _alpha
            )
        }
        
        debugPrint(
            """
                UIKit: CGColor -> \(CGColor.CYMK) -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return CGColor.clear
    }
}
