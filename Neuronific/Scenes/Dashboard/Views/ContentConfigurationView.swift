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
    @EnvironmentObject
    var model: AnyDragModel
    
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
