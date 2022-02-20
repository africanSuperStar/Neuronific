//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  String.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

// String extension
// ==============================================================================

// ==============================================================================
// Extension containing various utility methods and initializers.
extension String
{
    /// Initialize a `String` from a sequence of code units.
    ///
    /// - parameters:
    ///   - codeUnits: Sequence of code units.
    ///   - codec: A unicode encoding scheme.
    init? <C: UnicodeCodec, S: Sequence> (codeUnits: S, codec: C)
    where S.Iterator.Element == C.CodeUnit
    {
        var unicodeCode = codec
        var str = ""
        
        var iterator = codeUnits.makeIterator()
        var done     = false
        
        while !done
        {
            let result = unicodeCode.decode(&iterator)
         
            switch result
            {
            case .emptyInput: done = true
                
            case let .scalarValue(val):
                
                str.append(Character(val))
                
            case .error: return nil
                
            }
        }
        self = str
    }
    
    /// The last character of the string.
    ///
    /// If the string is empty, the value of this property is `nil`.
    var last: Character?
    {
        guard !isEmpty else { return nil }
        
        return self[index(before: endIndex)]
    }
    
    /// Return a new `String` with `c` adjoined to the end.
    ///
    /// - parameter c: Character to append.
    func appending(_ c: Character) -> String
    {
        var mutableSelf = self
        
        mutableSelf.append(c)
        
        return mutableSelf
    }
    
}
