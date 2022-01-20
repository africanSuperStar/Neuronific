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
            
            VSplitView
            {
                Group
                {
                    Text("Rounded Rectangle")
                        .font(.headline)
                    
                    HStack
                    {
                        Text("Corner Radius")
                    }
                    .frame(minHeight: 50.0)
                }
                    
                Group
                {
                    Text("Rounded Rectangle")
                        .font(.headline)
                    
                    HStack
                    {
                        Text("Corner Radius")
                    }
                    .frame(minHeight: 50.0)
                }
                    
                Group
                {
                    Text("Rounded Rectangle")
                        .font(.headline)
                    
                    HStack
                    {
                        Text("Corner Radius")
                    }
                    .frame(minHeight: 50.0)
                }
            }
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
