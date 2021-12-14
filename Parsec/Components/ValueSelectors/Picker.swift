//
//  Picker.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI


extension Picker
{
    enum Error: Swift.Error
    {
        case moreThanOneInitializer
        case failedToInstantiatePicker
    }
    
    public init?(url: URL, _ binding: Binding <SelectionValue>)
    where
    Label == Text
    {
        if let data = try? Data(contentsOf: url)
        {
            self.init(data: data, binding)
        }
        else
        {
            self.init(data: nil, binding)
        }
    }
    
    public init?(data: Data?, _ binding: Binding <SelectionValue>)
    where
    Label == Text
    {
        self.init("", selection: binding)
        {
            ParserView(parsers: []) as! Content
        }
        
        if  let string = String(data: data ?? Data(), encoding: .utf8),
            let json   = try? JSONParser(data: string)
        {
            do { self = try parsePicker(json, binding) } catch {  }
        }
    }
    
    public init?(parser: JSONParser, _ binding: Binding <SelectionValue>)
    where
    Label == Text
    {
        self.init("", selection: binding)
        {
            Text("") as! Content
        }
        
        do { self = try parsePicker(parser, binding) } catch {  }
    }
    
    @discardableResult
    public func parsePicker(_ json: JSONParser, _ binding: Binding <SelectionValue>) throws -> Self
    where
    Label == Text
    {
        if let _view = json["view"].string,
        
        _view == "Picker"
        {
            if let _title   = json["init"]["title"].string, !_title.isEmpty,
               let _content = json["init"]["content"].array, !_content.isEmpty
            {
                print("SWIFTUI: Picker -> init -> title -> \(_title)")
                print("SWIFTUI: Picker -> init -> content -> \(_content)")
                
                return Self(_title, selection: binding)
                {
                    ParserView(parsers: _content) as! Content
                }
            }
        }
        
        throw Error.failedToInstantiatePicker
    }
}
