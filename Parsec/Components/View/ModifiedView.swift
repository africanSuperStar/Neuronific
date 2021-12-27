//
//  ModifiedView.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/25.
//

import SwiftUI

extension View
{
    @discardableResult
    public func modify(_ json: JSONParser) -> AnyView
    {
        guard let modifiers = json["modifiers"].array else { return AnyView(self) }
     
        var _view = AnyView(self)
        
        modifiers.forEach
        {
            modifier in
            
            _view = _view.parseModifier(modifier)
        }
        
        return _view
    }
    
    @discardableResult
    public func parseModifier(_ modifier: JSONParser) -> AnyView
    {
        if modifier["AccessibilityLabel"]["tag"].string == "AccessibilityLabel"
        {
            return AnyView(self.accessibilityLabel(modifier["AccessibilityLabel"]))
        }
        else if modifier["AccessibilityInputLabels"]["tag"].string == "AccessibilityInputLabels"
        {
            return AnyView(self.accessibilityInputLabels(modifier["AccessibilityInputLabels"]))
        }
        else if modifier["ForegroundColor"]["tag"].string == "ForegroundColor"
        {
            return AnyView(self.foregroundColor(modifier["ForegroundColor"]))
        }
        else if modifier["Border"]["tag"].string == "Border"
        {
            return AnyView(self.border(modifier["Border"]))
        }
        else
        {
            return AnyView(self)
        }
    }
}

