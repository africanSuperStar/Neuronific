//
//  ComponentView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct ComponentView : View
{
    @ObservedObject var content: ContentDetail
    
    var body: some View
    {
        GeometryReader
        {
            reader in
            
            ZStack(alignment: .top)
            {
                Rectangle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.red, .blue, .purple, .red, .blue, .purple]), center: .top, startRadius: 50, endRadius: reader.size.height)
                    )
                    .opacity(0.2)
                
                Color.gray
                    .opacity(0.2)
                    .blur(radius: 3.0, opaque: false)
                
                ComponentSelectionAreaView(content: content)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,  alignment: .center)
            .cornerRadius(Theme.cornerRadius)
            .padding(.vertical, Theme.largePadding)
            .shadow(radius: 10)
        }
        .frame(minWidth: 150, maxWidth: 300, alignment: .center)
    }
}

struct ComponentView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ComponentView(content: ContentDetail())
    }
}
