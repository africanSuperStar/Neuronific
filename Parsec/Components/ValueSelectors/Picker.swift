//
//  Picker.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI


extension Picker : ParsedView { }

extension Picker
{
    public static func parse(_ json: JSONParser) throws -> Picker <Label, SelectionValue, Content>
    {
        throw ViewError.failedToInitializeView
    }
    
    public func parse(_ json: JSONParser, _ binding: Binding <SelectionValue>) throws -> Self
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
                    ParserViewList(parsers: _content) as! Content
                }
            }
        }
        
        throw ViewError.failedToInitializeView
    }
}
