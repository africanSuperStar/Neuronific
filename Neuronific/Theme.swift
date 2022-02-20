//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Theme.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct Theme
{
    static let primary   = Color(red: 0.07, green: 0.45, blue: 0.87)
    static let secondary = Color(red: 50 / 255, green: 168 / 255, blue: 82 / 255)
    
    static let transparentWhite = Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.3)
    
    static let lightGray = Color(red: 0.55, green: 0.55, blue: 0.55)
    static let gray      = Color(red: 0.45, green: 0.45, blue: 0.45)
    static let darkGray  = Color(red: 0.35, green: 0.35, blue: 0.35)
    
    static let primaryLight = Color(red: 1.0, green: 1.0, blue: 1.0)
    static let primaryDark  = Color(red: 0.0, green: 0.0, blue: 0.0)
    
    static let transparentGray = Color(red: 0.85, green: 0.85, blue: 0.85, opacity: 0.35)
    
    static let shadowRadius: CGFloat = 10.0
    static let cornerRadius: CGFloat = 10.0
    
    static let tinyPadding:  CGFloat = 2.5
    static let smallPadding: CGFloat = 4
    static let padding:      CGFloat = 7.5
    static let largePadding: CGFloat = 20
    
    static let tableRowHeight: CGFloat = 30.0
}
