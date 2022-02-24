//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+BorderColor.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

public struct BorderColor
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> BorderColor -> \(json)")
     
        if let _red   = json["red"].double,
           let _green = json["green"].double,
           let _blue  = json["blue"].double,
           let _alpha = json["alpha"].double
        {
            debugPrint(
                """
                    UIKit: CALayer -> BorderColor -> CGColor -> RGBA
                    -> red:   \(_red),
                    -> green: \(_green),
                    -> blue:  \(_blue),
                    -> alpha: \(_alpha)
                """
            )
            
            view.layer.borderColor = CGColor(
                red:   _red,
                green: _green,
                blue:  _blue,
                alpha: _alpha
            )
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> BorderColor -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
