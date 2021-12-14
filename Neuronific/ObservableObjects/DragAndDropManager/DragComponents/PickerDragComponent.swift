//
//  PickerDragComponent.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

import Parsec


final class PickerDragComponent : AnyDragComponent
{
    var binder: Binding <String> = .constant("")
    
    @ViewBuilder
    override var view: AnyView
    {
        let data = content.data(using: .utf8) ?? "{}".data(using: .utf8)!
        
        AnyView(Picker<Text, String, ParserView>(data: data, binder))
    }
}

