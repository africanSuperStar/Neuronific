//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+Opaque.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAOpaque
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> isOpaque -> \(json)")
     
        if let isOpaque = json["isOpaque"].bool
        {
            debugPrint(
                """
                    UIKit: CALayer -> isOpaque
                    -> value: \(isOpaque.description)
                """
            )
            
            view.layer.isOpaque = isOpaque
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> isOpaque -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
