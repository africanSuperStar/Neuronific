//
//  DragAndDropManager.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/05.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

import Parsec


final class TextDragComponent : AnyDragComponent
{
    @ViewBuilder
    override var view: AnyView
    {
        get
        {
            let data = content.data(using: .utf8) ?? "{}".data(using: .utf8)!
            
            AnyView(Text(data: data))
        }
        
        set { }
    }
}
