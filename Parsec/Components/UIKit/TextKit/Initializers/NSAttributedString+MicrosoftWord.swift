//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSAttributedString+MicrosoftWord.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/27.
//

import SwiftUI

public struct NSMSWordAttibutedString
{
    let json:       JSONParser
    let attachment: Binding <Data>?
    
    public func parse() -> NSMutableAttributedString?
    {
        debugPrint("UIKit: NSAttributedString -> init -> MS Word Document -> \(json)")
        
        guard let attachment = attachment?.wrappedValue,
              let attributedString = try? NSMutableAttributedString(
            data:               attachment,
            options:            [.documentType: NSAttributedString.DocumentType.wordML],
            documentAttributes: nil
        )
        else
        {
            debugPrint(
                """
                    UIKit: NSAttributedString -> init -> MS Word Document -> incorrect format,
                    \(ParsedObjectError.incorrectFormat)
                """
            )
            
            return nil
        }

        return attributedString
    }
}
