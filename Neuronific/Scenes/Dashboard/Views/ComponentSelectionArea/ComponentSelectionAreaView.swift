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
    
    @EnvironmentObject
    private var model: AnyDragModel
    
    @ObservedObject var content: ContentDetail

    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .leading)
            {
                SearchTextField(searchText: $searchText)
                    .padding(.vertical)
           
                Group
                {
                    Text("System Default Colors")
                    
                    MultiColorCardViews()
                        .padding(.bottom)
    
                    Divider()
                        .background(Theme.lightGray)
                        .frame(maxWidth: .infinity, minHeight: 1.0)
                }
                
                Group
                {
                    Text("Search Fields")
                    
                    SearchFieldViews()
                        .padding(.bottom)
    
                    Divider()
                        .background(Theme.lightGray)
                        .frame(maxWidth: .infinity, minHeight: 1.0)
                }
                
                Group
                {
                    Text("Table Row Components")
                    
                    TableRowViews()
                    
                    Divider()
                        .background(Theme.lightGray)
                        .frame(maxWidth: .infinity, minHeight: 1.0)
                }
                
                Group
                {
                    Text("Color Pickers")
                    
                    ColorPickerViews()
                    
                    Divider()
                        .background(Theme.lightGray)
                        .frame(maxWidth: .infinity, minHeight: 1.0)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
        }
    }
}

struct SelectableComponentView : View
{
    @State private var isDragging: Bool = false
    
    @EnvironmentObject
    var model: AnyDragModel
    
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
            .environmentObject(AnyDragModel())
    }
}
