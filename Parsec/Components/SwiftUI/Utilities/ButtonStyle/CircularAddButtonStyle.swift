//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AddButtonStyle.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/03/01.
//

import SwiftUI

struct CircularAddButtonStyle : ButtonStyle
{
    func makeBody(configuration: Self.Configuration) -> some View
    {
        configuration.label
            .padding()
            .foregroundColor(Color.black)
            .background(Color.white)
            .clipShape(Circle())
    }
}
