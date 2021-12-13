//
//  Accessibility+Label.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import SwiftUI


extension View
{
    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    @ViewBuilder
    public func accessibilityLabel(_ json: JSONParser) -> some View
    {
        self.parseAccessibilityLabel(json)
    }
    
    @discardableResult
    public func accessibilityLabel(_ url: URL) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
    {
        guard let data = try? Data(contentsOf: url)
        else
        {
            debugPrint("SWIFTUI: Failed to find Contents of URL, \(ViewModifierError.failedToFindContentsOfURL)")
            
            return self.accessibilityLabel("")
        }
    
        return self.accessibilityLabel(data)
    }
    
    @discardableResult
    public func accessibilityLabel(_ data: Data) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
    {
        guard  let string = String(data: data, encoding: .utf8),
               let json   = try? JSONParser(data: string)
        else
        {
            debugPrint("SWIFTUI: Failed to parse Contents of Data, \(ViewModifierError.failedToParseContentOfData)")
            
            return self.accessibilityLabel("")
        }

        guard let accessibilityLabel = self.parseAccessibilityLabel(json) as? ModifiedContent<Self, AccessibilityAttachmentModifier>
        else
        {
            debugPrint("SWIFTUI: Failed to cast Accessibility Label, \(ViewModifierError.failedToCastAccessiblityLabel)")
            
            return self.accessibilityLabel("")
        }
        
        return accessibilityLabel
    }
    
    @discardableResult
    public func parseAccessibilityLabel(_ json: JSONParser) -> some View
    {
        if let _modifier = json["modifier"].string,
        
        _modifier == "AccessibilityLabel"
        {
            let initializerCount = Array(arrayLiteral:
                json["init"]["text"].string != nil,
                json["init"]["localizedStringKey"].string != nil,
                json["init"]["string"].string != nil
            )
            
            if initializerCount.filter({ $0 == true }).count != 1
            {
                debugPrint("SWIFTUI: Text -> init -> more than 1 initializer, \(ViewModifierError.moreThanOneInitializer)")
            }
            
            if let _text = json["init"]["text"].string, !_text.isEmpty
            {
                debugPrint("SWIFTUI: ViewModier -> AccessibilityLabel -> Text -> \(_text)")
                
                return self.accessibilityLabel(Text(_text))
            }
            
            if let _key = json["init"]["localizedStringKey"].string, !_key.isEmpty
            {
                debugPrint("SWIFTUI: ViewModier -> AccessibilityLabel -> LocalizedStringKey -> \(_key)")
                
                return self.accessibilityLabel(LocalizedString(_key))
            }
            
            if let _string = json["init"]["string"].string, !_string.isEmpty
            {
                debugPrint("SWIFTUI: ViewModier -> AccessibilityLabel -> String -> \(_string)")
                
                return self.accessibilityLabel(_string)
            }
        }
        
        return self.accessibilityLabel("")
    }
}
