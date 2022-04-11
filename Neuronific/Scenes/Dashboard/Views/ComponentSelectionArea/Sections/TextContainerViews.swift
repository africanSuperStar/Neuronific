//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  TextContainerViews.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/04/11.
//

import SwiftUI
import Parsec

enum TextKitContainers: String, CaseIterable
{
    case basic = "Basic NSTextContainer Component"
}

struct TextKitContainerViews : View
{
    fileprivate var textKitContainerCards: [TitledPopoverCardView]
    {
        TextKitContainers.allCases.compactMap
        {
            row in

            switch row
            {
            case .basic:
                
                guard let contentURL = Bundle.main.url(
                    forResource:   "ns_attributed_string_ms_word",
                    withExtension: "json"
                )
                else
                {
                    debugPrint("ERROR: Failed to fetch `ns_attributed_string_ms_word.json` from Bundle.main")
                    
                    return nil
                }
                
                guard let contentData = try? Data(contentsOf: contentURL),
                      let content     = String(data: contentData, encoding: .utf8)
                else
                {
                    debugPrint("ERROR: Failed to read data from `ns_attributed_string_ms_word.json`")
                    
                    return nil
                }
                
                return TitledPopoverCardView(
                    title: row.rawValue,
                    type: """
                        An NSLayoutManager uses NSTextContainer to determine where to break lines,
                        lay out portions of text, and so on. An NSTextContainer object typically defines
                        rectangular regions, but you can define exclusion paths inside the text container
                        to create regions where text doesn’t flow.
                    """,
                    content: content
                )
            }
        }
    }
 
    fileprivate var textKitContainerDragComponents: [AnyDragComponent]
    {
        textKitContainerCards.compactMap
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
            ForEach(textKitContainerDragComponents, id: \.id)
            {
                SelectableComponentView(
                    component: $0
                )
                .padding(.top, Theme.tinyPadding)
            }
        }
    }
}

struct TextKitContainerViews_Previews: PreviewProvider
{
    static var previews: some View
    {
        TextKitContainerViews()
    }
}
