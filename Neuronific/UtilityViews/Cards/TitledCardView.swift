//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSAttributedStringCardView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/28.
//

import SwiftUI
import Parsec

struct TitledCardView : View
{
    let title:   String
    let type:    String
    let content: String

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
                
                Text(type)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(Theme.smallPadding)
            .multilineTextAlignment(.center)
        }
    }
}

struct TitledCardView_Previews : PreviewProvider
{
    static var previews: some View
    {
        TitledCardView(
            title:   "Titled Card View",
            type:    "",
            content: "{}"
        )
    }
}

struct TitledPopoverCardView : View
{
    let title:   String
    let type:    String
    let content: String

    @State
    private var showingPopover = false
    
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
                
                Button("Show Details")
                {
                    showingPopover = true
                }
                .foregroundColor(.gray)
                .popover(isPresented: $showingPopover)
                {
                    Text(type)
                        .font(.subheadline)
                        .padding(Theme.padding)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(Theme.smallPadding)
        }
    }
}

struct TitledPopoverCardView_Previews : PreviewProvider
{
    static var previews: some View
    {
        TitledPopoverCardView(
            title:   "NSAttributedString",
            type:    "Microsoft Word Document",
            content: "{}"
        )
    }
}
