//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Accessibility+Label.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import SwiftUI

public struct AccessibilityLabel : JSONModifier, ViewModifier
{
    let json: JSONParser
    
    public func body(content: Content) -> some View
    {
        accessibilityLabel(json, content: content)
    }
    
    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    @ViewBuilder
    public func accessibilityLabel(_ json: JSONParser, content: Content) -> some View
    {
        self.parse(json, content: content)
    }
    
    @discardableResult
    public func parse(_ json: JSONParser, content: Content) -> some View
    {
        let initializerCount = [
            json["init"]["text"].string != nil,
            json["init"]["localizedStringKey"].string != nil,
            json["init"]["string"].string != nil
        ]
        
        if initializerCount.filter({ $0 == true }).count != 1
        {
            debugPrint(
                """
                    SWIFTUI: AccessibilityLabel -> init -> more than 1 initializer,
                    \(ViewModifierError.moreThanOneInitializer)
                """
            )
        }
        
        if let _text = json["init"]["text"].string, !_text.isEmpty
        {
            debugPrint("SWIFTUI: ViewModier -> AccessibilityLabel -> Text -> \(_text)")
            
            return content.accessibilityLabel(Text(_text))
        }
        
        if let _key = json["init"]["localizedStringKey"].string, !_key.isEmpty
        {
            debugPrint("SWIFTUI: ViewModier -> AccessibilityLabel -> LocalizedStringKey -> \(_key)")
            
            return content.accessibilityLabel(LocalizedString(_key))
        }
        
        if let _string = json["init"]["string"].string, !_string.isEmpty
        {
            debugPrint("SWIFTUI: ViewModier -> AccessibilityLabel -> String -> \(_string)")
            
            return content.accessibilityLabel(_string)
        }
        
        return content.accessibilityLabel("")
    }
}
