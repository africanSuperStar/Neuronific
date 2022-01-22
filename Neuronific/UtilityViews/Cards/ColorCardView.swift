//
//  ColorCardView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/19.
//

import SwiftUI


struct ColorCardView : View
{
    let title:    String
    let headline: String
    let color:    Color
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(
                cornerRadius: Theme.cornerRadius,
                style: .continuous
            )
            .fill(color)
        }
        .shadow(radius: Theme.cornerRadius)
        .frame(height: 35)
        .help("\(title) - \(headline)")
    }
}

struct ColorCardView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ColorCardView(
            title:    "Title",
            headline: "Headline",
            color:    .red)
    }
}
