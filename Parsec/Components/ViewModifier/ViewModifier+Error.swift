//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  File.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import Foundation

public enum ViewError: Error
{
    case moreThanOneInitializer
    case failedToInitializeView
}

public enum ViewModifierError : Error
{
    case moreThanOneInitializer
    case failedToFindContentsOfURL
    case failedToParseContentOfData
    case failedToCastModifiedContent
}
