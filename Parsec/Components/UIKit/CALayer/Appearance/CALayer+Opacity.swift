//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+Opacity.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAOpacity
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> Opacity -> \(json)")
     
        if let _opacity = json["value"].double
        {
            debugPrint(
                """
                    UIKit: CALayer -> CornerRadius
                    -> radius: \(_opacity)
                """
            )
            
            view.layer.opacity = Float(_opacity)
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> Opacity -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
