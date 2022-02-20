//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Keyboard.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI

#if canImport(NSKit)
extension View
{
    func hideKeyboard()
    {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to:   nil,
            from: nil,
            for:  nil
        )
    }
}
#endif
