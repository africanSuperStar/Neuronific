//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  SearchFieldCardView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/22.
//

import SwiftUI

struct SearchFieldCardView : View
{
    var body: some View
    {
        SearchTextField(searchText: .constant("Search"))
            .disabled(true)
    }
}

struct SearchFieldCardView_Previews : PreviewProvider
{
    static var previews: some View
    {
        SearchFieldCardView()
    }
}
