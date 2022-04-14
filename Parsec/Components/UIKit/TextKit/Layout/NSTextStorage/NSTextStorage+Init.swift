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
    enum Sections : String, CaseIterable, Identifiable
    {
        var id: String { rawValue }
        
        case init_1 = "init() -> NSTextStorage"
        case init_2 = "init(string:) -> NSTextStorage"
    }
}

extension NSTextStorage
{
    public static func parse(_ json: JSONParser) throws -> Content
    {
        let textType = Sections.allCases.filter({ $0.rawValue == json["type"].string })
        
        return try textType.reduce(NSTextStorage())
        {
            (_, initializer) -> Content in

            switch initializer
            {
            case .init_1:
                
                return try NSTextStorage.parse1(json)
                
            case .init_2:
            
                return try NSTextStorage.parse2(json)
            }
        }
    }
}
