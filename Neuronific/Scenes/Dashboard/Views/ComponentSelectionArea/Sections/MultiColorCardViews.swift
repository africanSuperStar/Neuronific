//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  MultiColorCardViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/19.
//

import SwiftUI

enum SystemColor : CaseIterable
{
    case systemRed
    case systemOrange
    case systemYellow
    case systemGreen
    case systemTeal
    case systemBlue
    case systemIndigo
    case systemPurple
    case systemPink
    case systemGray
    case systemGray02
    case systemGray03
    case systemGray04
    case systemGray05
    case systemGray06
}

struct MultiColorCardViews : View
{
    fileprivate var colorCards: [ColorCardView]
    {
        SystemColor.allCases.compactMap
        {
            color in
            
            switch color
            {
            case .systemRed:
                return ColorCardView(
                    title: "SystemRed/Light",
                    headline: "#FF3B30 • RGB: 255,59,48",
                    color: Color(
                        red:     1.0,
                        green:   59/255,
                        blue:    48/255
                    )
                )
                
            case .systemOrange:
                return ColorCardView(
                    title: "SystemOrange/Light",
                    headline: "#FF9500 • RGB: 255,149,0",
                    color: Color(
                        red:     1.0,
                        green:   149/255,
                        blue:    0/255
                    )
                )
                
            case .systemYellow:
                return ColorCardView(
                    title: "SystemYellow/Light",
                    headline: "#FFCC00 • RGB: 255,204,0",
                    color: Color(
                        red:     1.0,
                        green:   204/255,
                        blue:    0/255
                    )
                )
            case .systemGreen:
                return ColorCardView(
                    title: "SystemGreen/Light",
                    headline: "#34C759 • RGB: 52,199,89",
                    color: Color(
                        red:     52/255,
                        green:   199/255,
                        blue:    89/255
                    )
                )
                
            case .systemTeal:
                return ColorCardView(
                    title: "SystemTeal/Light",
                    headline: "#5AC8FA • RGB: 90,200,250",
                    color: Color(
                        red:     90/255,
                        green:   200/255,
                        blue:    250/255
                    )
                )
                
            case .systemBlue:
                return ColorCardView(
                    title: "SystemBlue/Light",
                    headline: "#007AFF • RGB: 0,122,255",
                    color: Color(
                        red:     0/255,
                        green:   122/255,
                        blue:    1.0
                    )
                )
                
            case .systemIndigo:
                return ColorCardView(
                    title: "SystemIndigo/Light",
                    headline: "#5856D6 • RGB: 88,86,214",
                    color: Color(
                        red:     88/255,
                        green:   86/255,
                        blue:    214/255
                    )
                )
                
            case .systemPurple:
                return ColorCardView(
                    title: "SystemPurple/Light",
                    headline: "#AF52DE • RGB: 172,82,222",
                    color: Color(
                        red:     172/255,
                        green:   82/255,
                        blue:    222/255
                    )
                )
                
            case .systemPink:
                return ColorCardView(
                    title: "SystemPink/Light",
                    headline: "#FF2D55 • RGB: 255,45,85",
                    color: Color(
                        red:     1.0,
                        green:   45/255,
                        blue:    85/255
                    )
                )
                
            case .systemGray:
                return ColorCardView(
                    title: "SystemGray/Light",
                    headline: "#8E8E93 • RGB: 142,142,147",
                    color: Color(
                        red:     142/255,
                        green:   142/255,
                        blue:    147/255
                    )
                )
                
            case .systemGray02:
                return ColorCardView(
                    title: "SystemGray/02/Light",
                    headline: "#AEAEB2 • RGB: 174,174,178",
                    color: Color(
                        red:     174/255,
                        green:   174/255,
                        blue:    178/255
                    )
                )
                
            case .systemGray03:
                return ColorCardView(
                    title: "SystemGray/03/Light",
                    headline: "#C7C7CC • RGB: 199,199,204",
                    color: Color(
                        red:     199/255,
                        green:   199/255,
                        blue:    204/255
                    )
                )
                
            case .systemGray04:
                return ColorCardView(
                    title: "SystemGray/04/Light",
                    headline: "#D1D1D6 • RGB: 209,209,214",
                    color: Color(
                        red:     209/255,
                        green:   209/255,
                        blue:    214/255
                    )
                )
                
            case .systemGray05:
                return ColorCardView(
                    title: "SystemGray/05/Light",
                    headline: "#E5E5EA • RGB: 229,229,234",
                    color: Color(
                        red:     229/255,
                        green:   229/255,
                        blue:    234/255
                    )
                )
                
            case .systemGray06:
                return ColorCardView(
                    title: "SystemGray/06/Light",
                    headline: "#F2F2F7 • RGB: 242,242,247",
                    color: Color(
                        red:     242/255,
                        green:   242/255,
                        blue:    247/255
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
                content: "",
                native: AnyView(card)
            )
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 35)),
        GridItem(.adaptive(minimum: 35)),
        GridItem(.adaptive(minimum: 35)),
        GridItem(.adaptive(minimum: 35)),
        GridItem(.adaptive(minimum: 35)),
        GridItem(.adaptive(minimum: 35))
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
