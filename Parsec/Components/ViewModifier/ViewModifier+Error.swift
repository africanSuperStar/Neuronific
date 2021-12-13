//
//  File.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import Foundation


enum ViewModifierError : Error
{
    case moreThanOneInitializer
    case failedToFindContentsOfURL
    case failedToParseContentOfData
    case failedToCastAccessiblityLabel
}
