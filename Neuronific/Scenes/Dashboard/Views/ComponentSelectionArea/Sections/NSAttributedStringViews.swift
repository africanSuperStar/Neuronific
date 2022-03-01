//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSAttributedStringViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/28.
//

import SwiftUI

enum NSAttributedStringCards: String, CaseIterable
{
    case rawString = "Raw String"
    case msWord    = "Microsoft Word Document"
}

struct NSAttributedStringViews : View
{
    fileprivate var cards: [NSAttributedStringCardView]
    {
        NSAttributedStringCards.allCases.compactMap
        {
            card in
            
            switch card
            {
            case .rawString:
                
                guard let contentURL = Bundle.main.url(
                    forResource:   "ns_attributed_string_raw",
                    withExtension: "json"
                )
                else
                {
                    debugPrint("ERROR: Failed to fetch `ns_attributed_string_raw.json` from Bundle.main")
                    
                    return NSAttributedStringCardView(
                        content: "",
                        type:    card.rawValue
                    )
                }
                
                guard let content = try? String(contentsOfFile: contentURL.path)
                else
                {
                    debugPrint("ERROR: Failed to read data from `ns_attributed_string_raw.json`")
                    
                    return NSAttributedStringCardView(
                        content: "",
                        type:    card.rawValue
                    )
                }
                
                return NSAttributedStringCardView(
                    content: content,
                    type:    card.rawValue
                )
                
            case .msWord:
                
                guard let contentURL = Bundle.main.url(
                    forResource:   "ns_attributed_string_ms_word",
                    withExtension: "json"
                )
                else
                {
                    debugPrint("ERROR: Failed to fetch `ns_attributed_string_ms_word.json` from Bundle.main")
                    
                    return NSAttributedStringCardView(
                        content: "",
                        type:    card.rawValue
                    )
                }
                
                guard let contentData = try? Data(contentsOf: contentURL),
                      let content     = String(data: contentData, encoding: .utf8)
                else
                {
                    debugPrint("ERROR: Failed to read data from `ns_attributed_string_ms_word.json`")
                    
                    return NSAttributedStringCardView(
                        content: "",
                        type:    card.rawValue
                    )
                }
                
                return NSAttributedStringCardView(
                    content: content,
                    type:    card.rawValue
                )
            }
        }
    }
    
    fileprivate var searchFieldDragComponents: [AnyDragComponent]
    {
        cards.compactMap
        {
            card in
            
            AnyDragComponent(
                content: card.content,
                native:  AnyView(card)
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

struct NSAttributedStringViews_Previews : PreviewProvider
{
    static var previews: some View
    {
        NSAttributedStringViews()
    }
}
