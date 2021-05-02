//
//  CharacterConversion.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

// Character extension
//==============================================================================

//==============================================================================
// Extension containing methods related to the conversion of a character.
extension Character
{
    /// The first `UnicodeScalar` of `self`.
    var unicodeScalar: UnicodeScalar
    {
        let unicodes = String(self).unicodeScalars
        
        return unicodes[unicodes.startIndex]
    }
    
    /// Lowercase `self`.
    var lowercase: Character
    {
        let str = String(self).lowercased()
        
        return str[str.startIndex]
    }
    
    /// Uppercase `self`.
    var uppercase: Character
    {
        let str = String(self).uppercased()
     
        return str[str.startIndex]
    }
    
}
