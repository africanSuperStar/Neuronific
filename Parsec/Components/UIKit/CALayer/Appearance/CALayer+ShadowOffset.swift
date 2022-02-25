//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+ShadowOffset.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAShadowOffset
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> ShadowOffset -> \(json)")
     
        if let _size = CGSize.parse(json)
        {
            debugPrint(
                """
                    UIKit: CALayer -> ShadowOffset
                    -> size: \(_size.debugDescription)
                """
            )
            
            view.layer.shadowOffset = _size
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> ShadowOffset -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
