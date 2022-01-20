//
//  MultiColorCardViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/19.
//

import SwiftUI

enum DefaultColor : CaseIterable
{
    case systemRedLight
    case systemOrangeLight
    case systemRedDark
}

struct MultiColorCardViews : View
{
    fileprivate var colorCards: [ColorCardView]
    {
        DefaultColor.allCases.compactMap
        {
            color in
            
            switch color
            {
            case .systemRedLight:
                return ColorCardView(
                    title: "SystemRed/Light",
                    headline: "#FF3B30 • RGB: 255,59,48",
                    color: Color(
                        red:     255/255,
                        green:   59/255,
                        blue:    48/255
                    )
                )
                
            case .systemOrangeLight:
                return ColorCardView(
                    title: "SystemOrange/Light",
                    headline: "#FF9500 • RGB: 255,149,0",
                    color: Color(
                        red:     255/255,
                        green:   149/255,
                        blue:    0/255
                    )
                )
                
            case .systemRedDark:
                return ColorCardView(
                    title: "SystemRed/Light",
                    headline: "#FF3B30 • RGB: 255,59,48",
                    color: Color(
                        red:     255/255,
                        green:   59/255,
                        blue:    48/255
                    )
                )
            }
        }
    }
    
    fileprivate var colorCardDragComponents: [AnyDragComponent]
    {
        colorCards.compactMap
        {
            card in
            
            AnyDragComponent(
                native: AnyView(card)
            )
        }
    }
    
    let columns = [
        GridItem(.flexible(minimum: 130)),
        GridItem(.flexible(minimum: 130))
    ]
    
    var body: some View
    {
        LazyVGrid(columns: columns)
        {
            ForEach(colorCardDragComponents, id: \.id)
            {
                SelectableComponentView(
                    component: $0
                )
            }
        }
    }
}
