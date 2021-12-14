//
//  NetworkConfigurationView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct NetworkConfigurationView : View
{
    let data = (1...100).map { "Item \($0)" }

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVGrid(columns: columns, spacing: 30)
            {
                ForEach(data, id: \.self)
                {
                    item in
                    
                    Text(item)
                }
            }
            .padding(.horizontal)
            .background(Color.white)
            .opacity(0.1)
        }
        .frame(maxHeight: 200)
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
