//
//  Button.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/06/12.
//

import SwiftUI


extension Button
{
    public init?(url: URL)
    where
    Label == SwiftUI.Label<Text, Image>
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
                Label("", systemImage: "bolt")
            }
        }
    }
    
    public init(data: String)
    where
    Label == SwiftUI.Label<Text, Image>
    {
        self.init(action: {})
        {
            Label("", systemImage: "bolt")
        }
        
        if let json = try? JSONParser(data: data)
        {
            self = parseButton(json)
        }
    }
    
    public init(parser: JSONParser)
    where
    Label == SwiftUI.Label<Text, Image>
    {
        self.init(action: {})
        {
            SwiftUI.Label("", systemImage: "bolt")
        }
        
        self = parseButton(parser)
    }
    
    public func parseButton(_ json: JSONParser) -> Self
    where
    Label == SwiftUI.Label<Text, Image>
    {
        if let _view = json["view"].string,
        _view == "Button"
        {
            let action: () -> Void = json["init"]["action"].void
                
            if let _text        = json["init"]["text"].string,       !_text.isEmpty,
               let _systemImage = json["init"]["systemImage"].string, !_systemImage.isEmpty
            {
                return Self(action: action, label:
                {
                    SwiftUI.Label(_text, systemImage: _systemImage)
                })
            }
        }
        
        return Self(action: {})
        {
            SwiftUI.Label("", systemImage: "bolt")
        }
    }
    
}
