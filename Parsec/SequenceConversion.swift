//
//  SequenceConversion.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

// Sequence extension
// ==============================================================================

// ==============================================================================
// Extension containing conversion methods.
extension Sequence where Iterator.Element == Int
{
    /// Converts each `Int` in its `Character` equivalent and build a String
    /// with the result.
    var stringValue: String
    {
        let chars = map { Character(UnicodeScalar($0)!) }
        
        return String(chars)
    }
    
}
