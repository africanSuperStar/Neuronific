//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSTextContainer+Parse.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/26.
//

import AppKit

extension NSTextContainer : ParsedObject
{
    public typealias Content = NSTextContainer
}

extension NSTextContainer
{
    public static func parse(_ json: JSONParser) throws -> Self
    {
        if let _view = json["object"].string,
        
        _view == "TextKit"
        {
            let initParser = json["init"]["size"].self
            
            if let size = CGSize.parse(initParser)
            {
                debugPrint(
                """
                    UIKit: TextKit -> NSTextContainer
                                   -> init
                                   -> size
                                   -> \(size.debugDescription)
                """
                )
                
                return Self.init(size: size)
            }
        }
        
        throw ParsedObjectError.failedToInitializeObject
    }
}
