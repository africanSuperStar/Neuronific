//
//  PlaceholderViewModifier.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct PlaceHolder <T: View> : ViewModifier
{
    var placeHolder: T
    var show: Bool
    
    func body(content: Content) -> some View
    {
        ZStack(alignment: .leading)
        {
            if show { placeHolder }
        
            content
        }
    }
}

extension View
{
    func placeHolder <T:View> (_ holder: T, show: Bool) -> some View
    {
        self.modifier(PlaceHolder(placeHolder:holder, show: show))
    }
}
