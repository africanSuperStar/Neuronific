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

struct NSAttributedStringCardView : View
{
    let content:    String
    let type:       String

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
                Text("NSAttributedString")
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

struct NSAttributedStringCardView_Previews : PreviewProvider
{
    static var previews: some View
    {
        NSAttributedStringCardView(
            content:    "",
            type:       "Microsoft Word Document"
        )
    }
}
