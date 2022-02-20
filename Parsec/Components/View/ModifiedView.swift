//
//  ModifiedView.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/25.
//

import SwiftUI

protocol JSONModifier
{
    associatedtype ModifiedView: View
    associatedtype Modifier:     ViewModifier
    
    func parse(_ json: JSONParser, content: Modifier.Content) -> ModifiedView
}

extension JSONModifier
{
    @discardableResult
    public func parseURL(_ url: URL, content: Modifier.Content) -> some View
    {
        guard let data = try? Data(contentsOf: url)
        else
        {
            debugPrint("SWIFTUI: Failed to find Contents of URL, \(ViewModifierError.failedToFindContentsOfURL)")

            return self.parseData("{}".data(using: .utf8)!, content: content)
        }

        return self.parseData(data, content: content)
    }

    @discardableResult
    public func parseData(_ data: Data, content: Modifier.Content) -> some View
    {
        guard  let string = String(data: data, encoding: .utf8),
               let json   = try? JSONParser(data: string)
        else
        {
            debugPrint("SWIFTUI: Failed to parse Contents of Data, \(ViewModifierError.failedToParseContentOfData)")

            return self.parse(JSONParser.empty, content: content)
        }

        return self.parse(json, content: content)
    }
    
}

public enum ModifierTags : String, CaseIterable
{
    case accessbilityLabel       = "AccessibilityLabel"
    case accessbilityInputLabels = "AccessibilityInputLabels"
    case foregroundColor         = "ForegroundColor"
    case border                  = "Border"
    case padding                 = "Padding"
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

extension View
{
    @ViewBuilder
    public func modify(_ json: JSONParser) -> some View
    {
        self.modifier(AnyViewModifier(json: json))
    }
}

public struct AnyViewModifier : ViewModifier
{
    let json: JSONParser
    
    public func body(content: Content) -> some View
    {
        anyModifier(json, content: content)
    }
    
    @discardableResult
    public func anyModifier(_ json: JSONParser, content: Content) -> AnyView
    {
        guard let modifiers = json["modifiers"].array else { return AnyView(content) }
     
        var _view = AnyView(content)
        
        for modifier in modifiers
        {
            _view = parseModifier(modifier, content: _view)
        }
        
        return AnyView(_view)
    }
}

extension AnyViewModifier
{
    @discardableResult
    public func parseModifier(_ modifier: JSONParser, content: AnyView) -> AnyView
    {
        guard let tag = modifier["tag"].string else { return content }
        
        switch ModifierTags(tag)
        {
        case .accessbilityLabel:
            return AnyView(
                content.modifier(
                    AccessibilityLabel(json: modifier)
                )
            )
            
        case .accessbilityInputLabels:
            return AnyView(
                content.modifier(
                    AccessibilityInputLabels(json: modifier)
                )
            )
            
        case .foregroundColor:
            return AnyView(
                content.modifier(
                    ForegroundColor(json: modifier)
                )
            )
            
        case .border:
            return AnyView(
                content.modifier(
                    Border(json: modifier)
                )
            )
            
        case .padding:
            return AnyView(
                content.modifier(
                    Padding(json: modifier)
                )
            )
            
        default:
            return content
        }
    }
}
