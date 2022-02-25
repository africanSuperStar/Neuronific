//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+MaskedCorners.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct CAMaskedCorners
{
    let json: JSONParser
    var view: CALayerView
    
    public func parse() -> CALayer
    {
        debugPrint("UIKit: CALayer -> MaskedCorners -> \(json)")
     
        if let corners = json["corners"].array
        {
            debugPrint("UIKit: CALayer -> MaskedCorners -> corners: \(corners)")
            
            let maskedCorners = corners.compactMap
            {
                parser in
            
                AnyCACornerMask().parseCACornerMask(parser)
            }
            
            view.layer.maskedCorners = CACornerMask(maskedCorners)
            
            return view.layer
        }
        
        debugPrint(
            """
                UIKit: CALayer -> MaskCorners -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return view.layer
    }
}
