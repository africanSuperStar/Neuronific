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
    var uuid:    String                { get }
    var title:   String                { get }
    var parser:  JSONParser            { get set }
    var binding: Binding <AnyHashable> { get set }
    var content: String                { get set }
    
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
            
            return try! JSONParser(data: "{}")
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
        if let _content = try? String(contentsOfFile: url.path, encoding: .utf8)
        {
            self.init(content: _content, binding: binding)
            
            return
        }
        
        self.init(content: "{}")
    }
}
