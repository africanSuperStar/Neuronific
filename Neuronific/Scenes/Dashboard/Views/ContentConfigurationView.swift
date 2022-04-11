//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NetworkConfigurationView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI
import Parsec

struct ContentConfigurationView : View
{
    var body: some View
    {
        ZStack
        {
            Color.white
                .opacity(0.1)

            FilePickerView()
        }
        .frame(maxHeight: 280)
        .cornerRadius(Theme.cornerRadius)
        .padding(.horizontal, Theme.padding)
        .padding(.bottom, Theme.padding)
        .shadow(radius: 10)
    }
}

struct ContentConfigurationView_Previews : PreviewProvider
{
    static var previews : some View
    {
        ContentConfigurationView()
    }
}
