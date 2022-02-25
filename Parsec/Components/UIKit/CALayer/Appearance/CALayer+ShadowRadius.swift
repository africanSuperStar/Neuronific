//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ShadowRadius.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAShadowRadius
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> ShadowRadius -> \(json)")
     
        if let _shadowRadius = json["value"].double
        {
            debugPrint(
                """
                    UIKit: CALayer -> ShadowRadius
                    -> radius: \(_shadowRadius)
                """
            )
            
            view.layer.shadowRadius = _shadowRadius
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> ShadowRadius -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
