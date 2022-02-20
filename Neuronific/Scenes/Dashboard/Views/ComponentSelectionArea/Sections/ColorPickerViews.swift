//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ColorPickerViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/22.
//

import SwiftUI

struct ColorPickerViews : View
{
    var body: some View
    {
        ColorPicker(selection: .constant(.blue))
        {
            Text("Select a Color")
        }
    }
}

struct ColorPickerViews_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerViews()
    }
}
