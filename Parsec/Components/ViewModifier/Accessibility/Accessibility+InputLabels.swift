//
//  Accessibility+InputLabels.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import SwiftUI


public struct AccessibilityInputLabels : JSONModifier, ViewModifier
{
    let json: JSONParser
    
    public func body(content: Content) -> some View
    {
        accessibilityInputLabels(json, content: content)
    }
    
    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    @ViewBuilder
    public func accessibilityInputLabels(_ json: JSONParser, content: Content) -> some View
    {
        self.parse(json, content: content)
    }
    
    @discardableResult
    public func parse(_ json: JSONParser, content: Content) -> some View
    {
        if let _modifier = json["modifier"].string,
        
        _modifier == "AccessibilityInputLabels"
        {
            let initializerCount = Array(arrayLiteral:
                json["init"]["text"].array != nil,
                json["init"]["localizedStringKey"].array != nil,
                json["init"]["string"].array != nil
            )
            
            if initializerCount.filter({ $0 == true }).count != 1
            {
                debugPrint("SWIFTUI: AccessibilityInputLabels -> init -> more than 1 initializer, \(ViewModifierError.moreThanOneInitializer)")
            }
            
            if let _text = json["init"]["text"].array, !_text.isEmpty
            {
                debugPrint("SWIFTUI: ViewModifier -> AccessibilityInputLabels -> Text -> \(_text)")
                
                let _observed = _text.map({ Text($0.string ?? "") })
                
                return content.accessibilityInputLabels(_observed)
            }
            
            if let _key = json["init"]["localizedStringKey"].array, !_key.isEmpty
            {
                debugPrint("SWIFTUI: ViewModifier -> AccessibilityInputLabels -> LocalizedStringKey -> \(_key)")
                
                let _observed = _key.map({ LocalizedString($0.string ?? "") })
                
                return content.accessibilityInputLabels(_observed)
            }
            
            if let _string = json["init"]["string"].array, !_string.isEmpty
            {
                debugPrint("SWIFTUI: ViewModifier -> AccessibilityLabel -> String -> \(_string)")
                
                let _observed = _string.map({ $0.string ?? "" })
                
                return content.accessibilityInputLabels(_observed)
            }
        }
        
        return content.accessibilityInputLabels([""])
    }
}
