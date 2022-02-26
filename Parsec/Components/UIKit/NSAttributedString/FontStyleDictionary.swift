//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  StyleDictionary.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/26.
//

import AppKit

public struct NSScaledFont
{
    typealias FontStyleDictionary = [FontStyleKey.RawValue: FontDescription]

    enum FontStyleKey: String, Decodable
    {
        case largeTitle, title, title2, title3
        case headline, subheadline, body, callout
        case footnote, caption, caption2
    }

    struct FontDescription: Decodable
    {
        let fontSize: CGFloat
        let fontName: String
    }
    
    internal var styleDictionary: FontStyleDictionary?
    
    /// Create a `ScaledFont`
    ///
    /// - Parameter fontName: Name of a plist file (without the extension)
    ///   that contains the style dictionary used to scale fonts for each
    ///   text style.
    /// - Parameter bundle: The `Bundle` that contains the style dictionary.
    ///   Default is the main bundle.

    public init(fontName: String, _ bundle: Bundle = .main)
    {
        if let url    = bundle.url(forResource: fontName, withExtension: "plist"),
           let data   = try? Data(contentsOf: url)
        {
            let decoder = PropertyListDecoder()
            
            styleDictionary = try? decoder.decode(FontStyleDictionary.self, from: data)
        }
    }

    /// Get the scaled font for the given text style using the
    /// style dictionary supplied at initialization.
    ///
    /// - Parameter textStyle: The `UIFont.TextStyle` for the
    ///   font.
    /// - Returns: A `UIFont` of the custom font that has been
    ///   scaled for the users currently selected preferred
    ///   text size.
    ///
    /// - Note: If the style dictionary does not have
    ///   a font for this text style the default preferred
    ///   font is returned.

    public func font(forTextStyle textStyle: NSFont.TextStyle) -> NSFont
    {
        let parsedTextStyle = NSFont.TextStyle(rawValue: textStyle.rawValue)
        
        guard let styleKey        = FontStyleKey(parsedTextStyle),
              let fontDescription = styleDictionary?[styleKey.rawValue],
              let font = NSFont(name: fontDescription.fontName, size: fontDescription.fontSize)
        else
        {
            return NSFont.preferredFont(forTextStyle: textStyle)
        }
        
        return font
    }
}

extension NSScaledFont.FontStyleKey
{
    // swiftlint:disable cyclomatic_complexity
    init?(_ textStyle: NSFont.TextStyle)
    {
        #if !os(tvOS)
        if #available(watchOS 5.0, *)
        {
            if textStyle == .largeTitle
            {
                self = .largeTitle
            
                return
            }
        }
        #endif
        switch textStyle
        {
        case .title1:      self = .title
        case .title2:      self = .title2
        case .title3:      self = .title3
        case .headline:    self = .headline
        case .subheadline: self = .subheadline
        case .body:        self = .body
        case .callout:     self = .callout
        case .footnote:    self = .footnote
        case .caption1:    self = .caption
        case .caption2:    self = .caption2
        
        default: return nil
        }
    }
}
