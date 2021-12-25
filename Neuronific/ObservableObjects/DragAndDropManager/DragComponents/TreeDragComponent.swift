//
//  TreeDragComponent.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/15.
//

import SwiftUI
import Combine

import Parsec


final class TreeDragComponent : AnyDragComponent
{
    var bindings: [(component: AnyDragComponent, binding: Binding <String>)] = []
    
    convenience init(bindings: [(component: AnyDragComponent, binding: Binding <String>)])
    {
        self.init(content: "")
        
        self.bindings = bindings
    }
    
    @ViewBuilder
    override var view: AnyView
    {
        get
        {
            AnyView(
                ScrollView
                {
                    LazyVStack(alignment: .leading)
                    {
                        ForEach(bindings, id: \.component)
                        {
                            $0.component.view
                                .foregroundColor(Color.white)
                                .padding(2)
                        }
                        .padding(Theme.smallPadding)
                        .background(Theme.transparentGray)
                        .opacity(0.5)
                        .cornerRadius(Theme.cornerRadius)
                    }
                }
            )
        }
        
        set { }
    }
}
