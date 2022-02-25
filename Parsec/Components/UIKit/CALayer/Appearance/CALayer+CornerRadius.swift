//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+CornerRadius.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CACornerRadius
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> CornerRadius -> \(json)")
     
        if let _cornerRadius = json["value"].double
        {
            debugPrint(
                """
                    UIKit: CALayer -> CornerRadius
                    -> radius: \(_cornerRadius)
                """
            )
            
            view.layer.cornerRadius = _cornerRadius
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> CornerRadius -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
