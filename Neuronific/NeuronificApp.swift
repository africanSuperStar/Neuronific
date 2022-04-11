//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NeuronificApp.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

import SwiftUI
import Combine
import Parsec

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
         }
    }
}
