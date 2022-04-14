//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSDynamicAttributedFont.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct NSDynamicAttibutedFont
{
    let json:             JSONParser
    var attributedString: NSMutableAttributedString
    
    public func parse()
    {
        debugPrint("UIKit: NSAttributedString -> Dynamic UIFont -> \(json)")
     
        if let font = AnyFontTextStyle().parse(json)
        {
            let location = Int(json["location"].double ?? 0)
            let length   = Int(json["length"].double ?? 0)
            
            debugPrint("UIKit: NSAttributedString -> Dynamic UIFont -> value: \(font)")
            
            guard (length - location) <= (attributedString.length - location)
            else
            {
                debugPrint(
                    """
                        UIKit: NSAttributedString -> Dynamic UIFont -> not a valid range,
                        \(ParsedObjectError.invalidRange)
                    """
                )
                
                return
            }
            
            attributedString.addAttribute(
                .font,
                value: NSFont.preferredFont(forTextStyle: font, options: [:]),
                range: NSRange(location: location, length: length)
            )
            
            return
        }
        
        debugPrint(
            """
                UIKit: NSAttributedString -> Dynamic UIFont -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
    }
}
