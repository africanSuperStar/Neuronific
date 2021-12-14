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
        GridItem(.adaptive(minimum: 100, maximum: 150))
    ]
    
    var body: some View
    {
        ZStack
        {
            Color.white
                .opacity(0.1)

            ScrollView(.vertical, showsIndicators: false)
            {
                LazyVGrid(columns: columns, spacing: 5)
                {
                    ForEach(Modifier.modifiers, id: \.index)
                    {
                        $0.view
                            .frame(width: 80, height: 10)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(Theme.cornerRadius)
                            .shadow(radius: 10)
                    }
                }
                .padding()
            }
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
