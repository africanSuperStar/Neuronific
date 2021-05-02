//
//  UnicodeScalar.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

// UnicodeScalar extension
//==============================================================================

//==============================================================================
// Extension containing various utility methods.
extension UnicodeScalar
{
    /// The maximum value for a code point.
    static var max: Int { return 0x10FFFF }
    
    /// The minimum value for a code point.
    static var min: Int { return 0 }
    
    /// Return a `UnicodeScalar` with value `v` or nil if the value is outside
    /// of Unicode codespace or a surrogate pair code point.
    ///
    /// - parameter v: Unicode code point.
    /// - returns: A `UnicodeScalar` with value `v` or nil if the value is
    ///   outside of Unicode codespace or a surrogate pair code point.
    static func fromInt(_ v: Int) -> UnicodeScalar?
    {
        guard v >= min && v <= max else { return nil }
        
        guard !isSurrogatePair(v) else { return nil }
        
        return UnicodeScalar(v)
    }
    
    /// Return a `UnicodeScalar` with value `v` or nil if the value is outside
    /// of Unicode codespace.
    ///
    /// - parameter v: Unicode code point.
    /// - returns: A `UnicodeScalar` with value `v` or nil if the value is
    ///   outside of Unicode codespace.
    static func fromUInt32(_ v: UInt32) -> UnicodeScalar?
    {
        guard v >= UInt32(min) && v <= UInt32(max) else { return nil }
        
        guard !isSurrogatePair(v) else { return nil }
        
        return UnicodeScalar(v)
    }
    
    private static func isSurrogatePair <T: BinaryInteger> (_ v: T) -> Bool
    {
        return v >= 0xD800 && v <= 0xDFFF
    }
    
}
