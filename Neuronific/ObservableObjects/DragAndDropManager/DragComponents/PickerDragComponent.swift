//
//  PickerDragComponent.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI
import Combine

import Parsec


final class PickerDragComponent : AnyDragComponent
{
    var binder: Binding <String> = .constant("")
    
    override var description: String
    {
        return "Picker"
    }
    
    @ViewBuilder
    var body: some View
    {
        get
        {
            let data = content.data(using: .utf8) ?? "{}".data(using: .utf8)!
            
            Picker<Text, String, ParserView>(
                data: data,
                binder
            )
            .modify(parser)
        }
        
        set { }
    }
}
