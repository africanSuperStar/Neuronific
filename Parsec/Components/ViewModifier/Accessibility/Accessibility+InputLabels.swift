//
//  Accessibility+InputLabels.swift
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
    public func accessibilityInputLabels(_ json: JSONParser) -> some View
    {
        self.parseAccessibilityInputLabels(json)
    }
    
    @discardableResult
    public func accessibilityInputLabels(_ url: URL) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
    {
        guard let data = try? Data(contentsOf: url)
        else
        {
            debugPrint("SWIFTUI: Failed to find Contents of URL, \(ViewModifierError.failedToFindContentsOfURL)")
            
            return self.accessibilityInputLabels([""])
        }
    
        return self.accessibilityInputLabels(data)
    }
    
    @discardableResult
    public func accessibilityInputLabels(_ data: Data) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
    {
        guard  let string = String(data: data, encoding: .utf8),
               let json   = try? JSONParser(data: string)
        else
        {
            debugPrint("SWIFTUI: Failed to parse Contents of Data, \(ViewModifierError.failedToParseContentOfData)")
            
            return self.accessibilityInputLabels([""])
        }

        guard let accessibilityInputLabels = self.parseAccessibilityInputLabels(json) as? ModifiedContent<Self, AccessibilityAttachmentModifier>
        else
        {
            debugPrint("SWIFTUI: Failed to cast Accessibility Input Labels, \(ViewModifierError.failedToCastModifiedContent)")
            
            return self.accessibilityInputLabels([""])
        }
        
        return accessibilityInputLabels
    }
    
    @discardableResult
    public func parseAccessibilityInputLabels(_ json: JSONParser) -> some View
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
                
                return self.accessibilityInputLabels(_observed)
            }
            
            if let _key = json["init"]["localizedStringKey"].array, !_key.isEmpty
            {
                debugPrint("SWIFTUI: ViewModifier -> AccessibilityInputLabels -> LocalizedStringKey -> \(_key)")
                
                let _observed = _key.map({ LocalizedString($0.string ?? "") })
                
                return self.accessibilityInputLabels(_observed)
            }
            
            if let _string = json["init"]["string"].array, !_string.isEmpty
            {
                debugPrint("SWIFTUI: ViewModifier -> AccessibilityLabel -> String -> \(_string)")
                
                let _observed = _string.map({ $0.string ?? "" })
                
                return self.accessibilityInputLabels(_observed)
            }
        }
        
        return self.accessibilityInputLabels([""])
    }
}
