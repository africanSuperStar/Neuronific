//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+MaskToBounds.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAMaskToBounds
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> MaskToBounds -> \(json)")
     
        if let maskToBounds = json["value"].bool
        {
            debugPrint("UIKit: CALayer -> MaskToBounds -> value: \(maskToBounds)")
            
            view.layer.masksToBounds = maskToBounds
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> MaskToBounds -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
