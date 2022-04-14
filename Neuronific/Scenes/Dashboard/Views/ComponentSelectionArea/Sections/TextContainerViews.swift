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
    case textKit_init_1 = "NSTextStorage: init()"
    case textKit_init_2 = "NSTextStorage: init(string:)"
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
            case .textKit_init_1:
                
                guard let contentURL = Bundle.main.url(
                    forResource:   "textkit_nstextstorage_init_1",
                    withExtension: "json"
                )
                else
                {
                    debugPrint("ERROR: Failed to fetch `textkit_nstextstorage_init_1.json` from Bundle.main")
                    
                    return nil
                }
                
                guard let contentData = try? Data(contentsOf: contentURL),
                      let content     = String(data: contentData, encoding: .utf8)
                else
                {
                    debugPrint("ERROR: Failed to read data from `textkit_nstextstorage_init_1.json`")
                    
                    return nil
                }
                
                return TitledPopoverCardView(
                    title: row.rawValue,
                    type: """
                        Implemented by subclasses to initialise a new object
                        (the receiver) immediately after memory has been
                        allocated for it.
                    """,
                    content: content
                )
                
            case .textKit_init_2:
                
                guard let contentURL = Bundle.main.url(
                    forResource:   "textkit_nstextstorage_init_2",
                    withExtension: "json"
                )
                else
                {
                    debugPrint("ERROR: Failed to fetch `textkit_nstextstorage_init_2.json` from Bundle.main")
                    
                    return nil
                }
                
                guard let contentData = try? Data(contentsOf: contentURL),
                      let content     = String(data: contentData, encoding: .utf8)
                else
                {
                    debugPrint("ERROR: Failed to read data from `textkit_nstextstorage_init_2.json`")
                    
                    return nil
                }
                
                return TitledPopoverCardView(
                    title: row.rawValue,
                    type: """
                        Creates an attributedString with the specified
                        string and attributes.
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
