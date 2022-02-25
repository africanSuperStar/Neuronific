//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+ShouldRasterize.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAShouldRasterize
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> ShouldRasterize -> \(json)")
     
        if let shouldRasterize = json["shouldRasterize"].bool
        {
            debugPrint(
                """
                    UIKit: CALayer -> ShouldRasterize
                    -> value: \(shouldRasterize.description)
                """
            )
            
            view.layer.shouldRasterize = shouldRasterize
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> ShouldRasterize -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
