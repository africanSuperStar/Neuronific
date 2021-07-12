//
//  ComponentDetailView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

class ContentDetail: ObservableObject
{
    @Published var text = ""
}

struct ComponentDetailView : View
{
    @ObservedObject var content: ContentDetail
    
    var body: some View
    {
        ZStack
        {
            Text(content.text)
            
            Color.white
                .opacity(0.1)
        }
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
        ComponentDetailView(content: ContentDetail())
    }
}
