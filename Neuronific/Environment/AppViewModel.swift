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
