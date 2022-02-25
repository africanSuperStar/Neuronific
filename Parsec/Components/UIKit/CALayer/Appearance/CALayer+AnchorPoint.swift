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

public struct CAAnchorPoint
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> AnchorPoint -> \(json)")
     
        if let point = CGPoint.parse(json)
        {
            debugPrint(
                """
                    UIKit: CALayer -> AnchorPoint
                    -> point: \(point.debugDescription)
                """
            )
            
            view.layer.anchorPoint = point
            
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
