//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyDragComponent+View.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/01.
//

import SwiftUI
import Parsec

extension AnyDragComponent
{
    @discardableResult
    func body() -> AnyView
    {
        if let view = try? AnyView.parse(parser)
        {
            return view
        }
        
        return AnyView(EmptyView())
    }
}
