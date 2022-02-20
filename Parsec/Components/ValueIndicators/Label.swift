//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Label.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI

extension Label : ParsedView
{
    public typealias Content = Self
}

extension Label
{
    public static func parse <Content> (_ json: JSONParser) throws -> Content
    {
        throw ViewError.failedToInitializeView
    }
    
    public func parse <Content> (_ json: JSONParser) throws -> Content
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
                
                // swiftlint:disable force_cast
                return Self(_title, image: _image) as! Content
            }
        }
        
        throw ViewError.failedToInitializeView
    }
}
