//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSAttrString+Font.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public struct NSAttibutedFont
{
    let json: JSONParser
    var view: NSAttributedStringView
    
    public func parse()
    {
        debugPrint("UIKit: NSAttributedString -> UIFont -> \(json)")
     
        if let font = AnyFontTextStyle().parse(json)
        {
            debugPrint("UIKit: NSAttributedString -> UIFont -> value: \(font)")
            
            view.attributedText.addAttribute(
                .font,
                value: font,
                range: NSRange(location: 1, length: 4)
            )
            
            return
        }
        
        debugPrint(
            """
                UIKit: NSAttributedString -> UIFont -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
    }
}
