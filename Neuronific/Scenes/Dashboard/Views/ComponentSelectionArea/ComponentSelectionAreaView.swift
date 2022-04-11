//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ComponentSelectionAreaView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI
import Combine
import Parsec

struct ComponentSelectionAreaView : View
{
    @State
    private var searchText  = ""
    
    @State
    private var selectedUIFramework = 0
    
    @StateObject
    private var model = AnyDragModel.shared
    
    @ObservedObject var content: ContentDetail
    
    var body: some View
    {
        ScrollView
        {
            SearchTextField(searchText: $searchText)
                .padding(.vertical)
       
            ComponentViewSections(framework: $selectedUIFramework)
            TextKitViewSections(framework: $selectedUIFramework)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}

struct SelectableComponentView : View
{
    @State private var isDragging: Bool = false
    
    @StateObject
    var model = AnyDragModel.shared
    
    let component: AnyDragComponent
    
    var body: some View
    {
        component.native
            .onDrag {
                
                model.currentDraggedComponent = component
                
                let identifier = NSItemProvider(object: component)
                
                Swift.debugPrint("INFO: UTType Identifier for component \(identifier.registeredTypeIdentifiers)")
                
                return identifier
            }
    }
}

struct ComponentSelectionAreaView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ComponentSelectionAreaView(content: ContentDetail())
    }
}
