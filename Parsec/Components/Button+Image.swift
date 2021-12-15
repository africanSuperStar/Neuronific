//
//  Button+Image.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/15.
//

import SwiftUI


extension Button
{
    public init?(url: URL)
    where
    Label == SwiftUI.Image
    {
        if let data = try? Data(contentsOf: url),
           let jsonString = String(data: data, encoding: .utf8)
        {
            self.init(data: jsonString)
        }
        else
        {
            self.init(action: {})
            {
                SwiftUI.Image("")
            }
        }
    }
    
    public init(data: String)
    where
    Label == SwiftUI.Image
    {
        self.init(action: {})
        {
            SwiftUI.Image("")
        }
        
        if let json = try? JSONParser(data: data)
        {
            self = parseButton(json)
        }
    }
    
    public init(parser: JSONParser)
    where
    Label == SwiftUI.Image
    {
        self.init(action: {})
        {
            SwiftUI.Image("")
        }
        
        self = parseButton(parser)
    }
    
    public func parseButton(_ json: JSONParser) -> Self
    where
    Label == SwiftUI.Image
    {
        if let _view = json["view"].string,
        _view == "Button"
        {
            let action: () -> Void = json["init"]["action"].void
                
            if let _image = json["init"]["image"].string, !_image.isEmpty
            {
                return Self(action: action, label:
                {
                    SwiftUI.Image(_image)
                })
            }
            
            if let _systemImage = json["init"]["systemImage"].string, !_systemImage.isEmpty
            {
                return Self(action: action, label:
                {
                    SwiftUI.Image(systemName: _systemImage)
                })
            }
        }
        
        return Self(action: {})
        {
            SwiftUI.Image("")
        }
    }
}
