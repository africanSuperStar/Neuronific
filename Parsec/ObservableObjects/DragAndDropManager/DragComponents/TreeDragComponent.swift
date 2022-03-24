//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  TreeDragComponent.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/15.
//

import SwiftUI
import Combine

// final class TreeDragComponent : AnyDragComponent
// {
//    var bindings: [(component: AnyDragComponent, binding: Binding <String>)] = []
//    
//    convenience init(bindings: [(component: AnyDragComponent, binding: Binding <String>)])
//    {
//        self.init(content: "")
//        
//        self.bindings = bindings
//    }
//    
//    @ViewBuilder
//    override var view: AnyView
//    {
//        get
//        {
//            AnyView(
//                ScrollView
//                {
//                    LazyVStack(alignment: .leading)
//                    {
//                        ForEach(bindings, id: \.component)
//                        {
//                            $0.component.view
//                                .modify($0.component.parser)
//                        }
//                        .padding(Theme.smallPadding)
//                        .background(Theme.transparentGray)
//                        .opacity(0.5)
//                        .cornerRadius(Theme.cornerRadius)
//                    }
//                }
//            )
//        }
//        
//        set { }
//    }
// }
