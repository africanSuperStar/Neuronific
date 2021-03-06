//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NetworkConfigurationDetailView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct ContentConfigurationDetailView : View
{
    var body: some View
    {
        ZStack
        {
            Color.white
                .opacity(0.1)
        }
        .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: .infinity,  alignment: .center)
        .cornerRadius(Theme.cornerRadius)
        .padding(.vertical, Theme.padding)
        .padding(.trailing, Theme.padding)
        .shadow(radius: 10)
    }
}

struct ContentConfigurationDetailView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ContentConfigurationDetailView()
    }
}
