//
//  ContentView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

import SwiftUI
import Combine

import Parsec


struct ContentView : View
{
    @EnvironmentObject private var state:     UIState
    @EnvironmentObject private var fileModel: FileModel
    
    @StateObject var content = ContentDetail()
    
    var body: some View
    {
        NavigationView
        {
            ComponentView(content: content)

            VStack(alignment: .leading)
            {
                HStack
                {
                    ComponentDetailView(content: content)
                    
                    VStack(alignment: .center)
                    {
                        ComponentViewModifierView()
                        Spacer()
                        SimulatedDeviceView()
                        Spacer()
                    }
                    
                    NetworkConfigurationDetailView()
                }
                
                NetworkConfigurationView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var model = FileModel.shared
    
    static var previews: some View
    {
        ContentView()
            .environmentObject(FileModel.shared)
            .environmentObject(AnyDragModel.shared)
    }
}
