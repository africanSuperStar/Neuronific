//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ComponentViewModifierView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct ComponentViewModifierView : View
{
    @ObservedObject
    private var appModel = AppViewModel.shared
    
    var body: some View
    {
        ZStack
        {
            Color.white
                .opacity(0.1)
            
            HStack
            {
                Button
                {
                    appModel.debugWindow.toggle()
                    
                } label: {
                    
                    Image(systemName: "macwindow.on.rectangle")
                }

            }
        }
        .cornerRadius(Theme.cornerRadius)
        .padding(.vertical, Theme.padding)
        .padding(.leading, Theme.padding)
        .shadow(radius: 10)
        .frame(maxHeight: 50, alignment: .top)
    }
}

struct ComponentViewModifierView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ComponentViewModifierView()
    }
}
