//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+ShadowOpacity.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAShadowOpacity
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> ShadowOpacity -> \(json)")
     
        if let _shadowOpacity = json["value"].double
        {
            debugPrint(
                """
                    UIKit: CALayer -> ShadowOpacity
                    -> opacity: \(_shadowOpacity)
                """
            )
            
            view.layer.shadowOpacity = Float(_shadowOpacity)
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> ShadowOpacity -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
