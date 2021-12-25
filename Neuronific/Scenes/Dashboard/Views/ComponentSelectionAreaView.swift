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
        }
    }
}

struct SelectableComponentView : View
{
    @State private var isHovering: Bool = false
    @ObservedObject var content:   ContentDetail
    
    @Binding
    var component: AnyDragComponent
    
    var body: some View
    {
        component
            .view
            .padding(Theme.padding)
            .frame(minWidth: 130, alignment: .center)
            .foregroundColor(
                isHovering ? .white : .black
            )
            .background(
                isHovering ? Color.blue : Theme.transparentGray
            )
            .overlay(
                RoundedRectangle(cornerRadius: Theme.cornerRadius)
                    .stroke(
                        isHovering ? Color.white : Color.blue,
                        lineWidth: 2
                    )
            )
            .opacity(0.5)
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
