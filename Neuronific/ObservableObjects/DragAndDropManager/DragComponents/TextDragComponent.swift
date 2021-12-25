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
    override var description: String
    {
        return "Text"
    }
    
    @ViewBuilder
    var body: some View
    {
        get
        {
            let data = content.data(using: .utf8) ?? "{}".data(using: .utf8)!
            
            Text(data: data)
        }
        
        set { }
    }
}
