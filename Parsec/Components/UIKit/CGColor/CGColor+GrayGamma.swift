//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CGColor+GrayGamma.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

extension CGColor
{
    static let GRAY_GAMMA_2_2 = "Gray Gamma 2.2"
}

public struct CGColor_GrayGamma
{
    let json: JSONParser
    
    public func parse() -> CGColor
    {
        debugPrint("UIKit: CGColor -> \(CGColor.GRAY_GAMMA_2_2) -> \(json)")
     
        // MARK: Create a color in the "Generic" CMYK color space.

        guard let colorSpace = json["colorSpace"].string, colorSpace == CGColor.GRAY_GAMMA_2_2
        else
        {
            debugPrint(
                """
                    UIKit: CGColor -> \(CGColor.GRAY_GAMMA_2_2) -> not valid,
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
                    UIKit: CGColor -> \(CGColor.GRAY_GAMMA_2_2)
                    -> gray:  \(_gray),
                    -> alpha: \(_alpha)
                """
            )
            
            return CGColor(genericGrayGamma2_2Gray: _gray, alpha: _alpha)
        }
        
        debugPrint(
            """
                UIKit: CGColor -> \(CGColor.GRAY_GAMMA_2_2) -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return CGColor.clear
    }
}
