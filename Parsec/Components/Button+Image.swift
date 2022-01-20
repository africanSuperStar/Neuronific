//
//  Button+Image.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/15.
//

import SwiftUI


extension Button
{
    public static func parse(_ json: JSONParser) throws -> Self
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
        
        throw ViewError.failedToInitializeView
    }
}
