//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CGColor+Grayscale.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

extension CGColor
{
    static let GRAYSCALE = "Grayscale"
}

public struct CGColor_Grayscale
{
    let json: JSONParser
    
    public func parse() -> CGColor
    {
        debugPrint("UIKit: CGColor -> \(CGColor.GRAYSCALE) -> \(json)")
     
        // MARK: Create a color in the "Generic" gray color space.

        guard let colorSpace = json["colorSpace"].string, colorSpace == CGColor.GRAYSCALE
        else
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.GRAYSCALE) -> not valid,
                    \(ViewModifierError.wrongInitializer)
                """
            )
            
            return CGColor.clear
        }
        
        if let _gray  = json["gray"].double,
           let _alpha = json["alpha"].double
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.GRAYSCALE)
                    -> gray:  \(_gray),
                    -> alpha: \(_alpha)
                """
            )
            
            return CGColor(
                gray:  _gray,
                alpha: _alpha
            )
        }
        
        debugPrint(
            """
                UIKit: CGColor -> \(CGColor.GRAYSCALE) -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return CGColor.clear
    }
}
