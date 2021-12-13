//
//  Font.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import SwiftUI


extension Font
{
    public static func parseJSON(_ json: JSONParser) -> Self
    {
        let _isBold               = json["font"]["isBold"].bool               ?? false
        let _isItalic             = json["font"]["isItalic"].bool             ?? false
        let _isMonospacedDigit    = json["font"]["isMonospacedDigit"].bool    ?? false
        let _isSmallCaps          = json["font"]["isSmallCaps"].bool          ?? false
        let _isLowercaseSmallCaps = json["font"]["islowercaseSmallCaps"].bool ?? false
        let _isUppercaseSmallCaps = json["font"]["isUppercaseSmallCaps"].bool ?? false
        
        var _font = Font.title
        
        _isBold               ? _font = _font.bold()               : nil
        _isItalic             ? _font = _font.italic()             : nil
        _isMonospacedDigit    ? _font = _font.monospacedDigit()    : nil
        _isSmallCaps          ? _font = _font.smallCaps()          : nil
        _isLowercaseSmallCaps ? _font = _font.lowercaseSmallCaps() : nil
        _isUppercaseSmallCaps ? _font = _font.uppercaseSmallCaps() : nil

        return _font
    }
}

