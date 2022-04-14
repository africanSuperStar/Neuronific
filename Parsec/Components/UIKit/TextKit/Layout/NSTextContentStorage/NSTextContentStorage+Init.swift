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

extension NSTextContentStorage : ParsedObject
{
    public typealias Content = NSTextContentStorage
}

extension NSTextContentStorage
{
    enum Sections : String, CaseIterable, Identifiable
    {
        var id: String { rawValue }
        
        case init_1
    }
}

extension NSTextContentStorage
{
    public static func parse(_ json: JSONParser) throws -> Content
    {
        try Sections.allCases.reduce(NSTextContentStorage())
        {
            (_, initializer) -> Content in

            switch initializer
            {
            case .init_1:
                
                return try NSTextContentStorage.parse1(json)
            }
        }
    }
}
