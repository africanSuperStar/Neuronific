//
//  FocusRingExtension.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

extension NSTextField
{
    open override var focusRingType: NSFocusRingType
    {
        get { .none }
        set { }
    }
}
