//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  GenericParser+Operators.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2022/02/20.
//

import Foundation

// ==============================================================================
// Implementation of different parser operators.

/// Infix operator for `map`. It has the same precedence as the equality
/// operator (`==`).
///
/// - parameters:
///   - transform: A mapping function.
///   - parser: The parser whose result is mapped.
public func <^> <StreamType, UserState, Result, T> (
    transform: @escaping (Result) -> T,
    parser: GenericParser <StreamType, UserState, Result>
)
-> GenericParser <StreamType, UserState, T>
{
    return parser.map(transform)
}

/// Infix operator for `apply`. It has the same precedence as the equality
/// operator (`==`).
///
/// - parameters:
///   - leftParser: The parser containing the function to apply to the parser on
///     the right.
///   - rightParser: The parser on which the function is applied.
/// - returns: A parser with the applied function.
public func<*><StreamType, UserState, Result, T>(
    leftParser: GenericParser<StreamType, UserState, (Result) -> T>,
    rightParser: GenericParser<StreamType, UserState, Result>
) -> GenericParser<StreamType, UserState, T> {
    
    return rightParser.apply(leftParser)
    
}

/// Sequence parsing, discarding the value of the first parser. It has the same
/// precedence as the equality operator (`==`).
///
/// - parameters:
///   - leftParser: The first parser executed.
///   - rightParser: The second parser executed.
/// - returns: A parser returning the result of the second parser.
public func *><StreamType, UserState, Param1, Param2>(
    leftParser: GenericParser<StreamType, UserState, Param1>,
    rightParser: GenericParser<StreamType, UserState, Param2>
) -> GenericParser<StreamType, UserState, Param2> {
    
    return GenericParser.lift2(
        { $1 },
        parser1: leftParser,
        parser2: rightParser
    )
    
}

/// Sequence parsing, discarding the value of the second parser. It has the same
/// precedence as the equality operator (`==`).
///
/// - parameters:
///   - leftParser: The first parser executed.
///   - rightParser: The second parser executed.
/// - returns: A parser returning the result of the first parser.
public func <*<StreamType, UserState, Param1, Param2>(
    leftParser: GenericParser<StreamType, UserState, Param1>,
    rightParser: GenericParser<StreamType, UserState, Param2>
) -> GenericParser<StreamType, UserState, Param1> {
    
    return GenericParser.lift2(
        { p0, _ in p0 },
        parser1: leftParser,
        parser2: rightParser
    )
    
}

/// Infix operator for `flatMap` named _bind_. It has the same precedence as the
/// `nil` coalescing operator (`??`).
///
/// - parameters:
///   - parser: The parser whose result is passed to the `transform` function.
///   - transform: The function receiving the result of `parser`.
public func >>-<StreamType, UserState, Result, T>(
    parser: GenericParser<StreamType, UserState, Result>,
    transform: @escaping (Result) -> GenericParser<StreamType, UserState, T>
) -> GenericParser<StreamType, UserState, T> {
    
    return parser.flatMap(transform)
    
}
