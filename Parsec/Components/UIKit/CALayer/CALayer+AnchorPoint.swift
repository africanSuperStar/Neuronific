//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+AnchorPoint.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/23.
//

import SwiftUI

public struct AnchorPoint
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> AnchorPoint -> \(json)")
     
        var anchorPoint = CGPoint.zero
        
        if let x = json["x"].double, let y = json["y"].double
        {
            debugPrint("UIKit: CALayer -> AnchorPoint -> x: \(x)")
            
            anchorPoint.x = x
            anchorPoint.y = y
            
            view.layer.anchorPoint = anchorPoint
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> AnchorPoint -> init -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
