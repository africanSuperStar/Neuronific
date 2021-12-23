//
//  NetworkConfigurationView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI
import Parsec


struct ContentConfigurationView : View
{
    @ObservedObject
    private var model = AnyDragModel.shared

    let columns = [
        GridItem(.flexible(minimum: 130)),
        GridItem(.flexible(minimum: 130))
    ]
    
    var body: some View
    {
        ZStack
        {
            Color.white
                .opacity(0.1)

            ScrollView
            {
                LazyVGrid(columns: columns, spacing: 20)
                {
                    ForEach(model.selectableComponents, id: \.self)
                    {
                        component in
                        
                        component.view
                            .onDrag
                            {
                                model.currentDraggedComponent = component
                            
                                return NSItemProvider(object: component)
                            }
                            .onDrop(
                                of:       [.json, .fileURL],
                                delegate: AnyDropDelegate(
                                    component:               component,
                                    selectableComponents:    $model.selectableComponents,
                                    currentDraggedComponent: $model.currentDraggedComponent
                                )
                            )
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(maxHeight: 400)
        .cornerRadius(Theme.cornerRadius)
        .padding(.horizontal, Theme.padding)
        .padding(.bottom, Theme.padding)
        .shadow(radius: 10)
    }
}

struct ContentConfigurationView_Previews : PreviewProvider
{
    static var previews : some View
    {
        ContentConfigurationView()
    }
}
