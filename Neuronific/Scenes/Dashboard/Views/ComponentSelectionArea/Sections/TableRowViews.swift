//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  TableRowViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/22.
//

import SwiftUI
import Parsec

enum TableRows : CaseIterable
{
    case none
    case label
    case chevron
    case chevronLabel
    case icon
    case `switch`
    case chevronIcon
}

struct TableRowViews : View
{
    fileprivate var tableRowCards: [AnyDragComponent]
    {
        TableRows.allCases.compactMap
        {
            row in

            switch row
            {
            case .none:
                return AnyDragComponent(
                    content: "",
                    native: AnyView(
                        TableRowNoneCardView()
                    )
                )
            
            case .label:
                return AnyDragComponent(
                    content: "",
                    native: AnyView(
                        TableRowLabelCardView(title: "Labelled Table Row Component", label: "")
                    )
                )
            
            case .chevron:
                return AnyDragComponent(
                    content: "",
                    native: AnyView(
                        TableRowChevronCardView(title: "Chevron Table Row Component")
                    )
                )
            
            case .chevronLabel:
                return AnyDragComponent(
                    content: "",
                    native: AnyView(
                        TableRowLabelCardView(title: "Chevron Labelled Table Row Component", label: "")
                    )
                )
            
            case .icon:
                return AnyDragComponent(
                    content: "",
                    native: AnyView(
                        TableRowLabelCardView(title: "Icon Labelled Table Row Component", label: "")
                    )
                )
            
            case .switch:
                return AnyDragComponent(
                    content: "",
                    native: AnyView(
                        TableRowLabelCardView(title: "Switch Labelled Table Row Component", label: "")
                    )
                )
            
            case .chevronIcon:
                return AnyDragComponent(
                    content: "",
                    native: AnyView(
                        TableRowLabelCardView(title: "Chevron Iconed Table Row Component", label: "")
                    )
                )
            }
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    
    var body: some View
    {
        LazyVGrid(columns: columns)
        {
            ForEach(tableRowCards, id: \.id)
            {
                SelectableComponentView(
                    component: $0
                )
                .padding(.top, Theme.tinyPadding)
            }
        }
    }
}

struct TableRowViews_Previews: PreviewProvider
{
    static var previews: some View
    {
        TableRowViews()
    }
}
