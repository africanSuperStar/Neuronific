// ==============================================================================
// Primitive.swift
// SwiftParsec
//
// Created by David Dufresne on 2015-09-04.
// Copyright © 2015 David Dufresne. All rights reserved.
//
// The primitive parser combinators.
// ==============================================================================

import Foundation

// ==============================================================================
// Parsec extension where the elements are `Equatable`
public extension Parsec
    where
    StreamType.Iterator.Element: Equatable
{
    /// Return a parser that parses a collection of tokens.
    ///
    /// - parameters:
    ///   - tokensDescription: A function to describe the tokens.
    ///   - nextPosition: A function returning the position after the tokens.
    ///   - tokens: The collection of tokens to parse.
    /// - returns: A parser that parses a collection of tokens.
    static func tokens(
        tokensDescription: @escaping (StreamType) -> String,
        nextPosition: @escaping (
            SourcePosition, StreamType
        ) -> SourcePosition,
        tokens: StreamType
    )
    -> GenericParser<StreamType, UserState, StreamType>
    {
        return GenericParser(parse: { state in
            
            let position = state.position
            
            var tokensIterator = tokens.makeIterator()
            var token = tokensIterator.next()
            
            guard token != nil
            else
            {
                let error = ParseError.unknownParseError(position)
                return .none(.ok([], state, error))
            }
            
            var input = state.input
            
            var hasConsumed = false
            var consumedConstructor = Consumed <StreamType, UserState, StreamType>.none
            
            repeat {
                
                guard let inputToken = input.next()
                else
                {
                    var eofError = ParseError.unexpectedParseError(position, message: "")
                    
                    eofError.insertMessage(.expected(tokensDescription(tokens)))
                    
                    return consumedConstructor(.error(eofError))
                }
                
                if token! != inputToken
                {
                    let tokDesc = tokensDescription([inputToken])
                    
                    var expectedError = ParseError.unexpectedParseError(
                        position,
                        message: tokDesc
                    )
                    
                    let expected = Message.expected(tokensDescription(tokens))
                 
                    expectedError.insertMessage(expected)
                    
                    return consumedConstructor(.error(expectedError))
                }
                
                if !hasConsumed
                {
                    hasConsumed         = true
                    consumedConstructor = Consumed.some
                }
                
                token = tokensIterator.next()
                
            } while token != nil
            
            let newPosition = nextPosition(position, tokens)
            
            let newState = ParserState(
                input:     input,
                position:  newPosition,
                userState: state.userState
            )
          
            let error = ParseError.unknownParseError(newPosition)
            
            return .some(.ok(tokens, newState, error))
        })
    }
}
