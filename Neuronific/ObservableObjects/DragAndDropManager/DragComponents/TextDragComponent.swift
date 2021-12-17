//
//  DragAndDropManager.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/05.
//

import SwiftUI
import Combine

import Parsec


final class TextDragComponent : AnyDragComponent
{
    var parser: JSONParser?
    
    override var description: String
    {
        return "Text"
    }
    
    @ViewBuilder
    override var view: AnyView
    {
        get
        {
            AnyView(
                Text(parser: parser ?? JSONParser.empty)
            )
        }
        
        set { }
    }
}
