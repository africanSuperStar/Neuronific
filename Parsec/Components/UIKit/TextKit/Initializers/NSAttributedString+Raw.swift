//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSAttributedString+Raw.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/27.
//

import SwiftUI

public struct NSRawAttibutedString
{
    let json: JSONParser
    
    public func parse() -> NSMutableAttributedString?
    {
        debugPrint("UIKit: NSAttributedString -> init -> Raw String -> \(json)")
        
        guard let content = json["init"]["content"].string
        else
        {
            debugPrint(
                """
                    UIKit: NSAttributedString -> init -> Raw String -> invalid string,
                    \(ParsedObjectError.invalidRange)
                """
            )
            
            return nil
        }
        
        return NSMutableAttributedString(string: content)
    }
}
