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
    let json: JSONParser
    
    public func parse() -> NSMutableAttributedString?
    {
        debugPrint("UIKit: NSAttributedString -> init -> MS Word Document -> \(json)")
        
//        guard let fileURL = json["init"]["fileURL"].string
//        else
//        {
//            debugPrint(
//                """
//                    UIKit: NSAttributedString -> init -> MS Word Document -> invalid string,
//                    \(ParsedObjectError.invalidRange)
//                """
//            )
//
//            return nil
//        }
        
        let tmpDirectoryURL = URL(fileURLWithPath: NSHomeDirectory())
        
        let fileURL = tmpDirectoryURL.appendingPathComponent("tmp.docx")
        
        guard let data = try? Data(
            contentsOf: fileURL.absoluteURL,
            options:    .mappedIfSafe
        )
        else
        {
            return nil
        }
        
        return try? NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.wordML], documentAttributes: nil)
    }
}
