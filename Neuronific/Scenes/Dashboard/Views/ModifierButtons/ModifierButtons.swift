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
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45))
    ]
    
    var body: some View
    {
        ZStack
        {
            Color.white
                .opacity(0.1)

            HStack
            {
                ScrollView(.vertical, showsIndicators: false)
                {
                    LazyVGrid(columns: columns, spacing: 5)
                    {
                        ForEach(Modifier.modifiers, id: \.index)
                        {
                            $0.view
                                .frame(maxWidth: 15, maxHeight: .zero)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: Theme.cornerRadius
                                    )
                                    .fill(
                                        Color.blue.opacity(0.6)
                                    )
                                )
                                .overlay(
                                    RoundedRectangle(
                                        cornerRadius: Theme.cornerRadius
                                    )
                                    .stroke(
                                        Color.blue,
                                        lineWidth: 1
                                    )
                                )
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: 300)
                .padding(.horizontal)

                Spacer()
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
