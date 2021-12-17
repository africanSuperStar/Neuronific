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
                            Text($0.component.description)
                                .foregroundColor(Color.white)
                                .background(Theme.transparentGray)
                                .padding(2)
                        }
                    }
                }
            )
        }
        
        set { }
    }
}
