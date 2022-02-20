//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  FocusRingExtension.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

extension NSTextField
{
    open override var focusRingType: NSFocusRingType
    {
        get { .none }
        set { }
    }
}
