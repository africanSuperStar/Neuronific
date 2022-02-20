//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AppViewModel.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/20.
//

import SwiftUI
import Combine

class AppViewModel : ObservableObject
{
    public static let shared = AppViewModel()

    @Published
    var debugWindow: Bool = false
    
    init() { }
}
