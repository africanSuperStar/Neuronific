//
//  File.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import Foundation


public enum ViewModifierError : Error
{
    case moreThanOneInitializer
    case failedToFindContentsOfURL
    case failedToParseContentOfData
    case failedToCastModifiedContent
}
