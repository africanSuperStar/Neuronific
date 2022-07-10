//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  MenuableCardView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/07/10.
//

import SwiftUI
import Parsec

struct MenuablePopoverCardView : View
{
    let title:    String
    let type:     String
    let sections: [(view: AnyView, tag: String)]

    @State
    private var showingPopover = false
    
    let columns = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(
                cornerRadius: Theme.cornerRadius,
                style:        .continuous
            )
            .fill(.white)

            VStack
            {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Button("Show Options")
                {
                    showingPopover = true
                }
                .foregroundColor(.gray)
                .popover(isPresented: $showingPopover, arrowEdge: .trailing)
                {
                    LazyVGrid(columns: columns, alignment: .leading)
                    {
                        ForEach(sections, id: \.tag)
                        {
                            $0.view
                        }
                    }
                    .padding(Theme.padding)
                    .fixedSize()
                }
            }
            .padding(Theme.smallPadding)
        }
    }
}

struct MenuablePopoverCardView_Previews : PreviewProvider
{
    static var previews: some View
    {
        MenuablePopoverCardView(
            title:   "NSAttributedString",
            type:    "Microsoft Word Document",
            sections: []
        )
    }
}
