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
