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
            .fill(.white)

            VStack
            {
                RoundedRectangle(
                    cornerRadius: Theme.cornerRadius,
                    style: .continuous
                )
                .fill(color)
                
                Text(title)
                    .font(.body)
                    .foregroundColor(.black)

                Text(headline)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .padding(Theme.smallPadding)
            .multilineTextAlignment(.leading)
        }
        .shadow(radius: Theme.cornerRadius)
        .frame(minWidth: 120, minHeight: 100)
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
