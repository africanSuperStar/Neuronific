//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CGSize.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

extension CGSize
{
    public static func parse(_ json: JSONParser) -> Self?
    {
        debugPrint("UIKit: CGSize -> \(json)")
    
        if let _width  = json["width"].double,
           let _height = json["height"].double
        {
            debugPrint(
                """
                    UIKit: CGSize
                    -> width:  \(_width),
                    -> height: \(_height)
                """
            )
            
            return CGSize(width: _width, height: _height)
        }
     
        debugPrint(
            """
                UIKit: CGSize -> not valid or more than one initializer,
                \(ParsedObjectError.failedToInitializeObject)
            """
        )
        
        return nil
    }
}
