//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  TextView.swift
//  SwiftUIParsec
//
//  Created by Cameron de Bruyn on 2021/04/29.
//

import SwiftUI

extension Text : ParsedView
{
    public typealias Content = Self
}

extension Text
{
    public static func parse(_ json: JSONParser) throws -> Content
    {
        if let _view = json["view"].string,
        
        _view == "Text"
        {
            let initializerCount = [
                json["init"]["content"].string != nil,
                json["init"]["localizedStringKey"].string != nil,
                json["init"]["verbatim"].string != nil,
                json["init"]["image"].string != nil
            ]
            
            if initializerCount.filter({ $0 == true }).count != 1
            {
                print("SWIFTUI: Text -> init -> more than 1 initializer")
                
                throw ViewError.moreThanOneInitializer
            }
            
            if let _content = json["init"]["content"].string, !_content.isEmpty
            {
                print("SWIFTUI: Text -> init -> content -> \(_content)")
                
                return Self(_content)
            }
            
            if let _key = json["init"]["localizedStringKey"].string, !_key.isEmpty
            {
                print("SWIFTUI: Text -> init -> localizedStringKey -> \(_key)")
    
                return Self(LocalizedString(_key))
            }
            
            if let _verbatim = json["init"]["verbatim"].string, !_verbatim.isEmpty
            {
                print("SWIFTUI: Text -> init -> verbatim -> \(_verbatim)")
    
                return Self(verbatim: _verbatim)
            }
            
            if let _image = json["init"]["image"].string, !_image.isEmpty
            {
                print("SWIFTUI: Text -> init -> image -> \(_image)")
    
                return Self(Image(_image))
            }
        }
        
        throw ViewError.failedToInitializeView
    }
}
