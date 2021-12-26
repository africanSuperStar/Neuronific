//
//  ForegroundStyle.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/25.
//

import SwiftUI


extension View
{
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
    public func foregroundColor(_ json: JSONParser) -> some View
    {
        self.parseForegroundColor(json)
    }
    
    @discardableResult
    public func foregroundColor(_ url: URL) -> some View
    {
        guard let data = try? Data(contentsOf: url)
        else
        {
            debugPrint("SWIFTUI: Failed to find Contents of URL, \(ViewModifierError.failedToFindContentsOfURL)")

            return self.foregroundColor("{}".data(using: .utf8)!)
        }

        return self.foregroundColor(data)
    }

    @discardableResult
    public func foregroundColor(_ data: Data) -> some View
    {
        guard  let string = String(data: data, encoding: .utf8),
               let json   = try? JSONParser(data: string)
        else
        {
            debugPrint("SWIFTUI: Failed to parse Contents of Data, \(ViewModifierError.failedToParseContentOfData)")

            return self.parseForegroundColor(try! JSONParser(data: "{}"))
        }

        return self.parseForegroundColor(json)
    }

    @discardableResult
    public func parseForegroundColor(_ json: JSONParser) -> some View
    {
        if let _modifier = json["modifier"]["ForegroundColor"].array, _modifier.count == 1
        {
            if let _color = _modifier.first
            {
                debugPrint("SWIFTUI: ViewModifier -> ForegroundColor -> Color -> \(_color)")
                
                if let _red   = _color["red"].double,
                   let _green = _color["green"].double,
                   let _blue  = _color["blue"].double,
                   let _alpha = _color["alpha"].double
                {
                    debugPrint("SWIFTUI: ViewModier -> ForegroundColor -> Color -> RGBA -> red: \(_red), green: \(_green), blue: \(_blue), alpha: \(_alpha)")
                    
                    return self.foregroundColor(Color(red: _red, green: _green, blue: _blue, opacity: _alpha))
                }

                return self.foregroundColor(.clear)
            }
        }
        else
        {
            debugPrint("SWIFTUI: ForegroundColor -> init -> more than 1 initializer, \(ViewModifierError.moreThanOneInitializer)")
        }
        
        return self.foregroundColor(.clear)
    }
}
