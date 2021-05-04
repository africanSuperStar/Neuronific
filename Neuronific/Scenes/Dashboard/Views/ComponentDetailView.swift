//
//  ComponentDetailView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct ComponentDetailView : View
{
    var body: some View
    {
        Color.white
            .opacity(0.1)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,  alignment: .center)
            .cornerRadius(Theme.cornerRadius)
            .padding(.vertical, Theme.padding)
            .padding(.leading, Theme.padding)
            .shadow(radius: 10)
            .frame(maxWidth: 300)
    }
}

struct ComponentDetailView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ComponentDetailView()
    }
}
