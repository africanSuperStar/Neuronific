//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Either.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

// Either type
// ==============================================================================

// ==============================================================================
/// The Either enumeration represents values with two possibilities: a value of
/// type `Either <L, R>` is either `Left(L)` or `Right(R)`.
public enum Either <L, R>
{
    /// Left posibility.
    case left(L)
    
    /// Right posibility.
    case right(R)
}
