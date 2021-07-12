//
//  Button.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/06/12.
//

import SwiftUI

//{
//    "view": "Button",
//    "init": {
//        "label": null,
//        "localizedStringKey": null,
//        "action": null,
//    },
//    "style": {
//        "default": null,
//        "plain": null,
//        "link": null,
//        "bordered": null,
//        "borderless": null,
//        "card": null
//    }
//}

extension Button
{
    public init(url: URL)
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
                Text("Button") as! Label
            }
        }
    }
    
    public init(data: String)
    {
        self.init(action: {})
        {
            Text("Button") as! Label
        }
        
        if let json = try? JSONParser(data: data)
        {
            self = parseButton(json)
            self = parseButtonStyle(json)
        }
    }
    
    public init(parser: JSONParser)
    {
        self.init(action: {})
        {
            Text("Button") as! Label
        }
        
        self = parseButton(parser)
        self = parseButtonStyle(parser)
    }
    
    public func parseButton(_ json: JSONParser) -> Self
    {
        if let _view = json["view"].string,
        _view == "Button"
        {
            let action: () -> Void = json["init"]["action"].void
                
            if let _content = json["init"]["label"].string, !_content.isEmpty
            {
                return Self(action: action, label: {
                    Text(_content) as! Label
                })
            }
        }
        
        return Self(action: {})
        {
            Text("Button") as! Label
        }
    }

    public func parseButtonStyle(_ json: JSONParser) -> Self
    {
        let _style = DefaultButtonStyle.parseJSON(json)
        
        return self.buttonStyle(_style) as! Button<Label>
    }
}

extension PrimitiveButtonStyle
{
    public static func parseJSON(_ json: JSONParser) -> Self
    {
        let _isDefault    = json["style"]["default"].bool    ?? false
        let _isPlain      = json["style"]["plain"].bool      ?? false
        let _isLink       = json["style"]["link"].bool       ?? false
        let _isBordered   = json["style"]["bordered"].bool   ?? false
        let _isBorderless = json["style"]["borderless"].bool ?? false
        
        var _style = DefaultButtonStyle() as! Self
        
        _isDefault    ? _style = DefaultButtonStyle()    as! Self : nil
        _isPlain      ? _style = PlainButtonStyle()      as! Self : nil
        _isLink       ? _style = LinkButtonStyle()       as! Self : nil
        _isBordered   ? _style = BorderedButtonStyle()   as! Self : nil
        _isBorderless ? _style = BorderlessButtonStyle() as! Self : nil

        return _style
    }
}
