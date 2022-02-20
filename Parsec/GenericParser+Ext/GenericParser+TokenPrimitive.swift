//
//  GenericParser+TokenPrimitive.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2022/02/20.
//

import Foundation

// ==============================================================================
// Parsec extension
public extension Parsec
{
    /// Return a parser that accepts a token `Element` with `Result` when the
    /// function `match(Element) -> Result` returns
    /// `Optional.SomeWrapped(Result)`. The token can be shown using
    /// `tokenDescription(Element) -> String`. The position of the _next_ token
    /// should be returned when
    /// `nextPosition(SourcePosition, Element, StreamType) -> SourcePosition`
    /// is called with the current source position, the current token and the
    /// rest of the tokens.
    ///
    /// This is the most primitive combinator for accepting tokens. For example,
    /// the `GenericParser.character()` parser could be implemented as:
    ///
    ///     public static func character(
    ///         char: Character
    ///     ) -> GenericParser<StreamType, UserState, Result> {
    ///
    ///         return tokenPrimitive(
    ///             tokenDescription: { "\"" + $0 + "\"" },
    ///             nextPosition: { (var position, elem, _) in
    ///
    ///                 position.updatePosition(elem)
    ///                 return position
    ///
    ///             },
    ///             match: { elem in
    ///
    ///                 char == elem ? elem : nil
    ///
    ///             })
    ///
    ///     }
    ///
    /// - parameters:
    ///   - tokenDescription: A function to describe the token.
    ///   - nextPosition: A function returning the position of the next token.
    ///   - match: A function returning an optional result when the token match
    ///     a predicate.
    /// - returns: Return a parser that accepts a token `Element` with result
    ///   `Result` when the token matches.
    static func tokenPrimitive(
        tokenDescription: @escaping (StreamType.Iterator.Element) -> String,
        nextPosition: @escaping (
            SourcePosition, StreamType.Iterator.Element
        ) -> SourcePosition,
        match: @escaping (StreamType.Iterator.Element) -> Result?
    )
    -> GenericParser <StreamType, UserState, Result>
    {
        return GenericParser(parse: { state in
            
            var input = state.input
     
            let position = state.position
            
            guard let tok = input.next()
            else
            {
                let error = ParseError.unexpectedParseError(position, message: "")
                
                return .none(.error(error))
            }
            
            guard let result = match(tok)
            else
            {
                let error = ParseError.unexpectedParseError(
                    position,
                    message: tokenDescription(tok)
                )
             
                return .none(.error(error))
            }
            
            let newPosition = nextPosition(position, tok)
            
            let newState = ParserState(
                input: input,
                position: newPosition,
                userState: state.userState
            )
            
            let unknownError = ParseError.unknownParseError(newPosition)
            
            return .some(.ok(result, newState, unknownError))
        })
    }
}
