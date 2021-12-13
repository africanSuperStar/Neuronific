//
//  ComponentSelectionAreaView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI
import Combine


struct ComponentSelectionAreaView : View
{
    @StateObject var textDragModel = TextDragModel()
 
    @State private var searchText  = ""
    
    @ObservedObject var content: ContentDetail

    let columns = [
        GridItem(.flexible(minimum: 130)),
        GridItem(.flexible(minimum: 130))
    ]

    var body: some View
    {
        ScrollView
        {
            SearchTextField(searchText: $searchText)
                .padding()

            LazyVGrid(columns: columns, spacing: 20)
            {
                ForEach(textDragModel.selectableComponents, id: \.self)
                {
                    component in
                    
                    SelectableComponentView(content: content, component: component)
                }
            }
            .padding(.horizontal)
            .allowsTightening(false)
        }
    }
}

struct SelectableComponentView : View
{
    @State private var isHovering: Bool = false
    @ObservedObject var content:   ContentDetail
    
    let component: TextDragComponent
    
    var body: some View
    {
        if let data = component.content.data(using: .utf8)
        {
            Text(data: data)
                .padding(Theme.padding)
                .frame(minWidth: 130, alignment: .center)
                .foregroundColor(
                    isHovering ? .white : .black
                )
                .background(
                    isHovering ? Color.blue : Color.white
                )
                .overlay(
                    RoundedRectangle(cornerRadius: Theme.cornerRadius)
                        .stroke(
                            isHovering ? Color.white : Color.blue,
                            lineWidth: 2
                        )
                )
                .opacity(0.8)
                .cornerRadius(Theme.cornerRadius)
                .shadow(radius: Theme.shadowRadius)
                .onHover(perform:
                {
                    hovering in
                
                    isHovering = hovering
                    
                    if isHovering
                    {
                        content.text = component.content
                    }
                })
                .onDrag
                {
                    return NSItemProvider(object: TextDragComponent(content: component.content))
                }
        }
        else
        {
            EmptyView()
        }
    }
}

struct ComponentSelectionAreaView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ComponentSelectionAreaView(content: ContentDetail())
            .environmentObject(TextDragModel.shared)
    }
}
