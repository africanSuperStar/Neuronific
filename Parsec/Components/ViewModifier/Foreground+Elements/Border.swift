//
//  Border.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/26.
//

import SwiftUI

public struct Border : JSONModifier, ViewModifier
{
    let json: JSONParser
    
    public func body(content: Content) -> some View
    {
        border(json, content: content)
    }
    
    /// Adds a border to this view with the specified style and width.
    ///
    /// Use `border(_:width:)` to draw a border of a specified width around the
    /// view's frame. By default, the border appears inside the bounds of this
    /// view. In this example, the four-point wide border covers the text:
    ///
    ///     Text("Purple border inside the view bounds")
    ///         .border(Color.purple, width: 4)
    ///
    /// ![A screenshot showing showing border styles and thickness around a
    /// view.](SwiftUI-View-border-1.png)
    ///
    /// To place a border around the outside of this view, apply padding of the
    /// same width before adding the border:
    ///
    ///     Text("Purple border outside the view bounds.")
    ///         .padding(4)
    ///         .border(Color.purple, width: 4)
    ///
    /// ![A screenshot showing showing padded border styles and
    /// thickness.](SwiftUI-View-border-2.png)
    ///
    /// - Parameters:
    ///   - content: The border style.
    ///   - width: The thickness of the border; if not provided, the default is
    ///     1 pixel.
    ///
    /// - Returns: A view that adds a border with the specified style and width
    ///   to this view.
    @ViewBuilder
    public func border(_ json: JSONParser, content: Content) -> some View
    {
        self.parse(json, content: content)
    }
    
    @discardableResult
    public func parse(_ json: JSONParser, content: Content) -> some View
    {
        debugPrint("SWIFTUI: ViewModifier -> Border -> \(json)")
        
        if let _red   = json["color"]["red"].double,
           let _green = json["color"]["green"].double,
           let _blue  = json["color"]["blue"].double,
           let _alpha = json["color"]["alpha"].double,
           let _width = json["width"].double
        {
            debugPrint(
                """
                    SWIFTUI: ViewModifier -> Border -> Color -> RGBA
                        -> red: \(_red),
                        -> green: \(_green),
                        -> blue: \(_blue),
                        -> alpha: \(_alpha)"
                """
            )
            
            let color = Color(
                red:     _red,
                green:   _green,
                blue:    _blue,
                opacity: _alpha
            )
            
            return content.border(color, width: _width)
        }

        debugPrint(
            """
                "SWIFTUI: Border -> init -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )

        return content.border(.clear, width: 0.0)
    }
    
}
