//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  GenericTokenParser.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

// ==============================================================================
/// Generic implementation of the `TokenParser`.
public struct GenericTokenParser<UserState>: TokenParser
{
    /// Language definition parameterizing the lexer.
    public let languageDefinition: LanguageDefinition <UserState>
    
    /// Creates a `TokenParser` that contains lexical parsers that are defined
    /// using the definitions in the `LanguageDefinition` structure.
    ///
    /// One uses the appropiate language definition and selects the lexical
    /// parsers that are needed from the resulting `GenericTokenParser`.
    ///
    ///     import SwiftParsec
    ///
    ///     // The lexer
    ///     let swiftDef = LanguageDefinition<()>.swift
    ///     let lexer = GenericTokenParser(languageDefinition: swiftDef)
    ///
    ///     // The parser
    ///     let expression = lexer.identifier <|>
    ///         lexer.legalOperator <|> ...
    ///
    /// - parameter languageDefinition: Language definition for the lexical
    ///   parsers.
    public init(languageDefinition: LanguageDefinition<UserState>)
    {
        self.languageDefinition = languageDefinition
    }
    
}
