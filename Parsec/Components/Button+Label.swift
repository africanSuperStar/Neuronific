//
//  Button.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/06/12.
//

import SwiftUI

extension Button
{
    public static func parseLabel(_ json: JSONParser) throws -> Self
    where
    Label == SwiftUI.Label<Text, Image>
    {
        if let _view = json["view"].string,
        _view == "Button"
        {
            let action = Selector(json["init"]["action"].string ?? "")
                
            if let _text        = json["init"]["text"].string,        !_text.isEmpty,
               let _systemImage = json["init"]["systemImage"].string, !_systemImage.isEmpty
            {
                return Self(action: { print(action.description) }, label:
                {
                    SwiftUI.Label(_text, systemImage: _systemImage)
                })
            }
        }
        
        throw ViewError.failedToInitializeView
    }
    
}
