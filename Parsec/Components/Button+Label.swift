//
//  Button.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/06/12.
//

import SwiftUI


extension Button
{
    public func parse(_ json: JSONParser) throws -> Self
    where
    Label == SwiftUI.Label<Text, Image>
    {
        if let _view = json["view"].string,
        _view == "Button"
        {
            let action: () -> Void = json["init"]["action"].void
                
            if let _text        = json["init"]["text"].string,        !_text.isEmpty,
               let _systemImage = json["init"]["systemImage"].string, !_systemImage.isEmpty
            {
                return Self(action: action, label:
                {
                    SwiftUI.Label(_text, systemImage: _systemImage)
                })
            }
        }
        
        throw ViewError.failedToInitializeView
    }
    
}
