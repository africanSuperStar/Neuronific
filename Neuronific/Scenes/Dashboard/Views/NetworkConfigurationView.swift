//
//  NetworkConfigurationView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct NetworkConfigurationView : View
{
    @StateObject private var model = AnyDragModel.shared

    let columns = [
        GridItem(.flexible(minimum: 130)),
        GridItem(.flexible(minimum: 130))
    ]
    
    var body: some View
    {
        ZStack
        {
            Color.white
                .opacity(0.1)

            ScrollView
            {
                LazyVGrid(columns: columns, spacing: 20)
                {
                    ForEach(model.selectableComponents, id: \.self)
                    {
                        component in
                        
                        component.view
                    }
                }
                .padding(.horizontal)
                .allowsTightening(false)
            }
        }
        .frame(maxHeight: 400)
        .cornerRadius(Theme.cornerRadius)
        .padding(.horizontal, Theme.padding)
        .padding(.bottom, Theme.padding)
        .shadow(radius: 10)
    }
}

struct NetworkConfigurationView_Previews : PreviewProvider
{
    static var previews : some View
    {
        NetworkConfigurationView()
    }
}
