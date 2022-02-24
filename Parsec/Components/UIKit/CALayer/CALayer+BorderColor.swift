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
     
        if let _color = AnyCGColor().parseCGColor(json)
        {
            debugPrint(
                """
                    UIKit: CALayer -> BorderColor -> CGColor
                    -> colorSpace: \(_color.colorSpace.debugDescription)
                """
            )
            
            view.layer.borderColor = _color
            
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
