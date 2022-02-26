//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ParsedObject+Error.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import Foundation

public enum ParsedObjectError: Error
{
    case invalidRange
    case failedToInitializeObject
}
