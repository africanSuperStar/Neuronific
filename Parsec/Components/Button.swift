//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Button.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/30.
//

import SwiftUI

extension Button : ParsedView
{
    public typealias Content = Self
    
    public static func parse(_ json: JSONParser) throws -> Self
    {
        throw ViewError.failedToInitializeView
    }
}
