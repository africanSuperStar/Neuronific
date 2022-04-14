//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ParsedObject.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public protocol ParsedObject : AnyObject
{
    var content: Content? { get set }
    
    init?(url: URL) throws
    init?(data: Data) throws
    init?(parser: JSONParser)
    
    associatedtype Content : AnyObject
    
    static func parse(_ json: JSONParser) throws -> Content
}

extension ParsedObject
{
    public var content: Content?
    {
        get
        {
            return nil
        }
        
        set { }
    }
    
    public init?(url: URL) throws
    {
        if let data = try? Data(contentsOf: url)
        {
            try self.init(data: data)
        }
        else
        {
            throw ParsedObjectError.failedToInitializeObject
        }
    }
    
    public init?(data: Data) throws
    {
        if  let string = String(data: data, encoding: .utf8),
            let parser = try? JSONParser(data: string),
            let url    = URL(string: "{}")
        {
            do {
                try self.init(url: url)
                
                self.content = try Self.parse(parser)
                return
            }
            catch
            {
                throw ParsedObjectError.failedToInitializeObject
            }
        }
        
        return nil
    }
    
    public init?(parser: JSONParser)
    {
        if let url = URL(string: "{}")
        {
            do {
                try self.init(url: url)
                
                self.content = try Self.parse(parser)
                return
            }
            catch { }
        }
    
        return nil
    }
    
}
