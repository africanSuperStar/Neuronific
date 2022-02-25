//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+BorderWidth.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

public struct CABorderWidth
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> BorderWidth -> \(json)")
     
        if let borderWidth = json["value"].double
        {
            debugPrint("UIKit: CALayer -> BorderWidth -> value: \(borderWidth)")
            
            view.layer.borderWidth = borderWidth
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> BorderWidth -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
