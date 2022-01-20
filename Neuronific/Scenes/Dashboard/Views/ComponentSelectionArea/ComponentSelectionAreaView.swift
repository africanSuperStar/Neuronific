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
            SearchTextField(searchText: $searchText)
                .padding()
       
            MultiColorCardViews()
                .padding(.horizontal)
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
                
            } preview: {
                
                component.native
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
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
