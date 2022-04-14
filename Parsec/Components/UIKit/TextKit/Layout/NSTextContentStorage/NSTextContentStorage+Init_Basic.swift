//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSTextStorage+Init_Basic.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/04/14.
//

import AppKit

extension NSTextContentStorage
{
    internal static func parse1(_ json: JSONParser) throws -> Content
    {
        if let textKit   = json["view"].string,
           let textClass = json["class"].string,
           let textType  = json["type"].string,
        
        textKit   == "TextKit",
        textClass == "NSTextStorage",
        textType  == "init() -> NSTextStorage"
        {
            return NSTextContentStorage()
        }
        
        throw ParsedObjectError.failedToInitializeObject
    }
}
