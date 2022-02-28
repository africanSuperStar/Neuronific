//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  SearchFieldViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/22.
//

import SwiftUI

enum SearchFields : CaseIterable
{
    case `default`
    case cancel
    case scribble
}

struct SearchFieldViews : View
{
    fileprivate var searchFieldCards: [SearchFieldCardView]
    {
        SearchFields.allCases.compactMap
        {
            searchField in
            
            switch searchField
            {
            case .default:
                return SearchFieldCardView()
            
            case .cancel:
                return SearchFieldCardView()
            
            case .scribble:
                return SearchFieldCardView()
            }
        }
    }
    
    fileprivate var searchFieldDragComponents: [AnyDragComponent]
    {
        searchFieldCards.compactMap
        {
            card in
            
            AnyDragComponent(
                content: "",
                native: AnyView(card)
            )
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    
    var body: some View
    {
        LazyVGrid(columns: columns)
        {
            ForEach(searchFieldDragComponents, id: \.id)
            {
                SelectableComponentView(
                    component: $0
                )
                .padding(.top, Theme.tinyPadding)
            }
        }
    }
}

struct SearchFieldViews_Previews : PreviewProvider
{
    static var previews: some View
    {
        SearchFieldViews()
    }
}
