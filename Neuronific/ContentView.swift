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
    
    @State private var scale:      CGFloat = 0.5
    @State private var translateX: CGFloat = 0.0
    @State private var translateY: CGFloat = 0.0
    
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
                           
                        SimulatedDeviceCanvasView()
                    }
                    
                    ContentConfigurationDetailView()
                }
                
                ContentConfigurationView()
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
