//
//  Label.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI


extension Label
{
    enum LabelError: Error
    {
        case moreThanOneInitializer
    }
    
    public init?(url: URL)
    where
    Title == Text,
    Icon == Image
    {
        if let data = try? Data(contentsOf: url)
        {
            self.init(data: data)
        }
        else
        {
            self.init("", image: "")
        }
    }
    
    public init?(data: Data)
    where
    Title == Text,
    Icon == Image
    {
        self.init("", image: "")

        if  let string = String(data: data, encoding: .utf8),
            let json   = try? JSONParser(data: string)
        {
            do { self = try parseLabel(json) } catch {  }
        }
    }
    
    public init?(parser: JSONParser)
    where
    Title == Text,
    Icon == Image
    {
        self.init("", image: "")

        do { self = try parseLabel(parser) } catch {  }
    }
    
    public func parseLabel(_ json: JSONParser) throws -> Self
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
        
        return Self("", image: "")
    }
}
