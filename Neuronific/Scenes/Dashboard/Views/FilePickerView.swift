//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  FilePickerView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/24.
//

import SwiftUI
import Parsec

struct FilePickerView : View
{
    @State private var filename        = ""
    @State private var showFileChooser = false
    
    @State private var hovered = false
    
    @StateObject
    var model = AnyDragModel.shared
    
    @State
    private var currentComponent = AnyDragComponent(content: "{}")
    
    let columns = [
        GridItem(.adaptive(minimum: 150), alignment: .top)
    ]
    
    var body: some View
    {
        ScrollView
        {
            if model.modifiableComponents.isEmpty
            {
                Text("Drop Neuronific files here...")
                    .frame(maxWidth: .infinity, minHeight: 200)
                    .background(Theme.darkGray)
                    .cornerRadius(Theme.cornerRadius)
                    .padding()
                    .onDrop(
                        of:       [.neuronific, .json, .fileURL], // MARK: Validated in the delegate
                        delegate: AnyDropDelegate(
                            component:         currentComponent,
                            completionHandler: appendModifiableContent
                        )
                    )
            }
            else
            {
                LazyVGrid(columns: columns, spacing: 20)
                {
                    ForEach($model.modifiableComponents, id: \.self)
                    {
                        $component in
                        
                        VStack(spacing: .zero)
                        {
                            Text($component.wrappedValue.title)
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                                .foregroundColor(.white)
                                .background(Theme.primary)
                        
                            ScrollView
                            {
                                $component.wrappedValue.view
                                    .padding(Theme.smallPadding)
                            }
                        }
                        .frame(maxHeight: 150.0)
                        .cornerRadius(Theme.cornerRadius)
                        .background(
                            RoundedRectangle(cornerRadius: Theme.cornerRadius)
                                .fill(
                                    currentComponent == component && hovered
                                    ? Theme.transparentWhite
                                    : Theme.gray
                                )
                        )
                        .onDrag
                        {
                            model.currentDraggedComponent = component
                            
                            let identifier = NSItemProvider(object: component)
                            
                            Swift.debugPrint(
                                """
                                    INFO: UTType Identifier for component \(identifier.registeredTypeIdentifiers)
                                """
                            )
                            
                            return identifier
                        }
                        .onHover
                        {
                            hovered in
                            
                            self.hovered     = hovered
                            currentComponent = component
                        }
                    }
                }
                .padding()
                .background(Theme.darkGray)
                .frame(maxWidth: .infinity, minHeight: .zero, maxHeight: 250)
                .onDrop(
                    of:       [.neuronific, .json, .fileURL], // MARK: Validated in the delegate
                    delegate: AnyDropDelegate(
                        component:         currentComponent,
                        completionHandler: appendModifiableContent
                    )
                )
            }

            HStack
            {
                Spacer()

                Button("Select File")
                {
                    let dialog = NSOpenPanel()
                    
                    dialog.title                   = "Choose a Neuronific file"
                    dialog.showsResizeIndicator    = true
                    dialog.showsHiddenFiles        = false
                    dialog.allowsMultipleSelection = true
                    dialog.canChooseDirectories    = true
                    dialog.allowedContentTypes     = [.neuronific, .json, .fileURL]
                    
                    if dialog.runModal() ==  NSApplication.ModalResponse.OK
                    {
                        let results = dialog.urls
                        
                        for result in results
                        {
                            let path: String = result.path
                            
                            Swift.debugPrint("INFO: Selected a Neuronific file with path: \(path)")
                            
                            appendModifiableContent(url: result.absoluteURL)
                        }
                    }
                    else
                    {
                        return
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func appendModifiableContent(url: URL?)
    {
        let bindingUUID = UUID().uuidString
        
        if  let url = url,
            let component = AnyDragComponent(url: url, binding: .constant(bindingUUID))
        {
            model.modifiableComponents.append(component)
            model.componentTranslations.append(.zero)
            
            currentComponent = component
            
            Swift.debugPrint("INFO: Appended Selectable Component: \(currentComponent)")
            Swift.debugPrint("INFO: Current Selectable Components: \(model.modifiableComponents.count)")
        }
    }
    
    private func appendModifiableContent(component: AnyDragComponent)
    {
        DispatchQueue.main.async
        {
            model.modifiableComponents.append(component)
            model.componentTranslations.append(.zero)
        }
        
        currentComponent = component
        
        Swift.debugPrint("INFO: Appended Selectable Component: \(currentComponent)")
        Swift.debugPrint("INFO: Current Selectable Components: \(model.modifiableComponents.count)")
    }
}

struct FilePickerView_Previews: PreviewProvider
{
    static var previews: some View
    {
        FilePickerView()
    }
}
