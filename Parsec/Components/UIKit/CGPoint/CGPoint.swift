//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CGPoint.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

extension CGPoint
{
    public static func parse(_ json: JSONParser) -> Self?
    {
        debugPrint("UIKit: CGPoint -> \(json)")
    
        if let _x = json["x"].double,
           let _y = json["y"].double
        {
            debugPrint(
                """
                    UIKit: CGPoint
                    -> x: \(_x),
                    -> y: \(_y)
                """
            )
            
            return CGPoint(x: _x, y: _y)
        }
     
        debugPrint(
            """
                UIKit: CGPoint -> not valid or more than one initializer,
                \(ParsedObjectError.failedToInitializeObject)
            """
        )
        
        return nil
    }
}
