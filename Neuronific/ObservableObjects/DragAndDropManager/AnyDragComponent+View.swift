//
//  AnyDragComponent+View.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/01.
//

import SwiftUI
import Parsec


extension AnyDragComponent
{
    @discardableResult
    func body() -> AnyView
    {
        if let view = try? AnyView.parse(parser)
        {
            return view
        }
        
        return AnyView(EmptyView())
    }
}
