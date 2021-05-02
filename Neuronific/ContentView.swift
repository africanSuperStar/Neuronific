//
//  ContentView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

import SwiftUI
import Parsec

struct ContentView : View
{
    @EnvironmentObject private var state: UIState

    let url: URL = Bundle.main.url(forResource: "content_view", withExtension: "json")!

    var body: some View
    {
        NavigationView
        {
            JSONViewer(url: url)
            
            VStack(alignment: .center)
            {
                Text(url: url)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
