//
//  NeuronificApp.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

import SwiftUI
import Combine


@main
struct NeuronificApp: App
{
    @SceneBuilder
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(AppViewModel.shared)
                .environmentObject(FileModel.shared)
                .environmentObject(AnyDragModel.shared)
        }
    }
}
