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
