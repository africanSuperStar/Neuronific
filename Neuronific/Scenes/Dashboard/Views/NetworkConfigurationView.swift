//
//  NetworkConfigurationView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct NetworkConfigurationView : View
{
    var body: some View
    {
        Color.white
            .opacity(0.1)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,  alignment: .center)
            .cornerRadius(Theme.cornerRadius)
            .padding(.horizontal, Theme.padding)
            .padding(.bottom, Theme.padding)
            .shadow(radius: 10)
            .frame(maxHeight: 200)
    }
}

struct NetworkConfigurationView_Previews : PreviewProvider
{
    static var previews : some View
    {
        NetworkConfigurationView()
    }
}
