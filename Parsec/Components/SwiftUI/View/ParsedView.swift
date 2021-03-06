//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ParsedView.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/30.
//

import SwiftUI

public protocol ParsedView
{
    init?(url: URL) throws
    init?(data: Data) throws
    init?(parser: JSONParser)
    
    associatedtype Content: View
    
    static func parse(_ json: JSONParser) throws -> Self
}

extension ParsedView
{
    public init?(url: URL) throws
    {
        if let data = try? Data(contentsOf: url)
        {
            try self.init(data: data)
        }
        else
        {
            throw ViewError.failedToInitializeView
        }
    }
    
    public init?(data: Data) throws
    {
        if  let string = String(data: data, encoding: .utf8),
            let parser = try? JSONParser(data: string)
        {
            do {
                self = try Self.parse(parser)
                return
            }
            catch
            {
                throw ViewError.failedToInitializeView
            }
        }
        
        return nil
    }
    
    public init?(parser: JSONParser)
    {
        do {
            self = try Self.parse(parser)
            return
        }
        catch { }
    
        return nil
    }
    
}
