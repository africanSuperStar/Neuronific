//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyDragProtocol.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/01.
//

import SwiftUI
import Parsec

public protocol AnyDragProtocol : NSObject, Identifiable
{
    var uuid:          String                { get }
    var title:         String                { get }
    var parser:        JSONParser            { get set }
    var content:       String                { get set }
    var binding:       Binding <AnyHashable> { get set }
    
    init(content: String)
    init?(content: String, binding: Binding <AnyHashable>)
    
    init?(url: URL, binding: Binding <AnyHashable>)
}

extension AnyDragProtocol
{
    var parser: JSONParser
    {
        get {
            if let _parser = try? JSONParser(data: content)
            {
                return _parser
            }
            
            return JSONParser.empty
        }
        
        set { }
    }
    
    init(content: String)
    {
        self.init()

        self.content = content
    }
    
    init(content: String, binding: Binding <AnyHashable>)
    {
        self.init()
        
        self.content = content
        self.binding = binding
    }

    init?(url: URL, binding: Binding <AnyHashable>)
    {
        // MARK: Parse JSON Text File
        
        if let content = try? String(contentsOfFile: url.path, encoding: .utf8)
        {
            self.init(content: content, binding: binding)
            
            return
        }
     
        self.init(content: "{}")
    }
}
