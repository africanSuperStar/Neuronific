//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ConditionalViewModifier.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/20.
//

import SwiftUI

extension View
{
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if` <Content: View> (
        _ condition: Bool,
        transform: (Self) -> Content
    )
    -> some View
    {
        if condition
        {
            transform(self)
        }
        else
        {
            self
        }
    }
}
