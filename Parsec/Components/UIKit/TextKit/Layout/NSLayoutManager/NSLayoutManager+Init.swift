//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSLayoutManager+Init.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/27.
//

import AppKit

extension NSLayoutManager : ParsedObject
{
    public typealias Content = NSLayoutManager
}

extension NSLayoutManager
{
    public static func parse(_ json: JSONParser) throws -> Content
    {
        var layoutManager = NSLayoutManager()

        if let textKit = json["TextKit"].string,
        
        textKit == "NSLayoutManager"
        {
            layoutManager = AnyNSLayoutManagerConfiguration().parse(json, manager: layoutManager)
            
            return layoutManager
        }
        
        throw ParsedObjectError.failedToInitializeObject
    }
}
