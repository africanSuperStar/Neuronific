//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ForegroundColor.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/25.
//

import SwiftUI

public struct ForegroundColor : JSONModifier, ViewModifier
{
    let json: JSONParser
    
    public func body(content: Content) -> some View
    {
        foregroundColor(json, content: content)
    }
    
    /// Sets the color of the foreground elements displayed by this view.
    ///
    /// - Parameter color: The foreground color to use when displaying this
    ///   view. Pass `nil` to remove any custom foreground color and to allow
    ///   the system or the container to provide its own foreground color.
    ///   If a container-specific override doesn't exist, the system uses
    ///   the primary color.
    ///
    /// - Returns: A view that uses the foreground color you supply.
    @ViewBuilder
    public func foregroundColor(_ json: JSONParser, content: Content) -> some View
    {
        self.parse(json, content: content)
    }
    
    @discardableResult
    public func parse(_ json: JSONParser, content: Content) -> some View
    {
        debugPrint("SWIFTUI: ViewModifier -> ForegroundColor -> Color -> \(json)")
            
        if let _red   = json["red"].double,
           let _green = json["green"].double,
           let _blue  = json["blue"].double,
           let _alpha = json["alpha"].double
        {
            debugPrint(
                """
                    SWIFTUI: ViewModifier -> ForegroundColor -> Color -> RGBA
                    -> red:   \(_red),
                    -> green: \(_green),
                    -> blue:  \(_blue),
                    -> alpha: \(_alpha)
                """
            )
            
            return content.foregroundColor(
                Color(
                    red:     _red,
                    green:   _green,
                    blue:    _blue,
                    opacity: _alpha
                )
            )
        }
        else
        {
            debugPrint(
                """
                    SWIFTUI: ForegroundColor -> init -> invalid file or more than 1 initializer,
                    \(ViewModifierError.moreThanOneInitializer)
                """
            )

            return content.foregroundColor(.primary)
        }
    }
}
