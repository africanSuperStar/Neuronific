//
//  TableRowViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/22.
//

import SwiftUI

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
                    native: AnyView(
                        TableRowNoneCardView()
                    )
                )
            
            case .label:
                return AnyDragComponent(
                    native: AnyView(
                        TableRowLabelCardView()
                    )
                )
            
            case .chevron:
                return AnyDragComponent(
                    native: AnyView(
                        TableRowChevronCardView()
                    )
                )
            
            case .chevronLabel:
                return AnyDragComponent(
                    native: AnyView(
                        TableRowLabelCardView()
                    )
                )
            
            case .icon:
                return AnyDragComponent(
                    native: AnyView(
                        TableRowLabelCardView()
                    )
                )
            
            case .switch:
                return AnyDragComponent(
                    native: AnyView(
                        TableRowLabelCardView()
                    )
                )
            
            case .chevronIcon:
                return AnyDragComponent(
                    native: AnyView(
                        TableRowLabelCardView()
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
