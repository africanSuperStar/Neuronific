//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSTextStorage.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/27.
//

import AppKit

extension NSTextStorage : ParsedObject
{
    public typealias Content = NSTextStorage
}

extension NSTextStorage
{
    public static func parse(_ json: JSONParser) throws -> Content
    {
        let textStorage = NSTextStorage.ini

        if let textKit = json["textKit"].string,
        
        textKit == "NSTextStorage"
        {
            return textStorage
        }
        
        throw ParsedObjectError.failedToInitializeObject
    }
}
