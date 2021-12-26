//
//  TypeErasedView.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/25.
//

import SwiftUI

extension View
{
    /// Returns a type-erased version of the view.
    public var typeErased: AnyView { AnyView(self) }
}
