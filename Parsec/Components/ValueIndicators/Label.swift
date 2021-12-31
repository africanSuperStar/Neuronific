//
//  Label.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI


extension Label : ParsedView { }

extension Label
{
    public static func parse(_ json: JSONParser) throws -> Label<Title, Icon>
    {
        throw ViewError.failedToInitializeView
    }
    
    public func parse(_ json: JSONParser) throws -> Self
    where
    Title == Text,
    Icon == Image
    {
        if let _view = json["view"].string,
        
        _view == "Label"
        {
            if let _title = json["init"]["title"].string, !_title.isEmpty,
               let _image = json["init"]["image"].string, !_image.isEmpty
            {
                print("SWIFTUI: Label -> init -> title -> \(_title)")
                print("SWIFTUI: Label -> init -> image -> \(_image)")
                
                return Self(_title, image: _image)
            }
        }
        
        throw ViewError.failedToInitializeView
    }
}
