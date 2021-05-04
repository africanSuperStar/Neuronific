//
//  ComponentSelectionAreaView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI
import Combine


struct ComponentSelectionAreaView : View
{
    @State private var searchText: String = ""
    
    var body: some View
    {
        VStack(alignment: .center)
        {
            SearchTextField(searchText: $searchText)
        }
        .padding()
    }
}

struct ComponentSelectionAreaView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ComponentSelectionAreaView()
    }
}
