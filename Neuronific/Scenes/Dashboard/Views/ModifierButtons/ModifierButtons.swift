//
//  ModifierButtons.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI

struct ModifierButtons : View
{
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVGrid(columns: columns, spacing: 30)
            {
                ForEach(Modifier.modifiers, id: \.index) { $0.view }
            }
            .padding()
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

struct ModifierButtons_Previews : PreviewProvider
{
    static var previews: some View
    {
        ModifierButtons()
    }
}
