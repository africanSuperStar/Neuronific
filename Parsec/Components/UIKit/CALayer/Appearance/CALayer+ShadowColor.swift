//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+ShadowColor.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAShadowColor
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> ShadowColor -> \(json)")
     
        if let _color = AnyCGColor().parseCGColor(json)
        {
            debugPrint(
                """
                    UIKit: CALayer -> ShadowColor -> CGColor
                    -> colorSpace: \(_color.colorSpace.debugDescription)
                """
            )
            
            view.layer.shadowColor = _color
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> ShadowColor -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
