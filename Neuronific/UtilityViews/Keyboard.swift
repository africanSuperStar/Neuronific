//
//  Keyboard.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI


#if canImport(UIKit)
extension View
{
    func hideKeyboard()
    {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to:   nil,
            from: nil,
            for:  nil
        )
    }
}
#endif
