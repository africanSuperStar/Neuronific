//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  UIState.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/02.
//

import Foundation
import SwiftUI

class UIState : ObservableObject
{
    public static let shared = UIState()
    
    enum Tab: Int
    {
        case dashboard, items
    }
    
    enum Route: Identifiable
    {
        case debugger
        
        static let prefix = "neuronificapp"
        
        var id: String
        {
            switch self
            {
            case .debugger: return "Debugger"
            }
        }

        @ViewBuilder
        func makeSheetView() -> some View
        {
            NavigationView
            {
                switch self
                {
                case .debugger:
                    Text("")
                }
            }
        }
    }
    
    @Published var selectedTab = Tab.dashboard
    @Published var route: Route?
}
