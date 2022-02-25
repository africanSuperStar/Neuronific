//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+BackgroundColor.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

public struct CABackgroundColor
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> BackgroundColor -> \(json)")
     
        if let _color = AnyCGColor().parseCGColor(json)
        {
            debugPrint(
                """
                    UIKit: CALayer -> BackgroundColor -> CGColor
                    -> colorSpace: \(_color.colorSpace.debugDescription)
                """
            )
            
            view.layer.backgroundColor = _color
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> BackgroundColor -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
