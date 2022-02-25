//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+RasterizationScale.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CARasterizationScale
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> RasterizationScale -> \(json)")
     
        if let _rasterizationScale = json["value"].double
        {
            debugPrint(
                """
                    UIKit: CALayer -> RasterizationScale
                    -> radius: \(_rasterizationScale)
                """
            )
            
            view.layer.rasterizationScale = _rasterizationScale
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> RasterizationScale -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
