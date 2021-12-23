//
//  AnyDropDelegate.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/21.
//

import SwiftUI
import Parsec


struct AnyDropDelegate : DropDelegate
{
    let component: AnyDragComponent
    
    @Binding
    var selectableComponents: [AnyDragComponent]

    @Binding
    var currentDraggedComponent: AnyDragComponent?
    
    func validateDrop(info: DropInfo) -> Bool
    {
        var handled = false

        if info.hasItemsConforming(to: [.json, .fileURL])
        {
            let itemProviders = info.itemProviders(for: [.json, .fileURL])

            for itemProvider in itemProviders
            {
                if itemProvider.canLoadObject(ofClass: AnyDragComponent.self)
                {
                    Swift.debugPrint("SUCCESS: Managed to validate drop of AnyDragComponent")

                    handled = true
                }
                else
                {
                    Swift.debugPrint("ERROR: Failed to validate drop of AnyDragComponent")

                    handled = false
                }
            }
        }

        return handled
    }
    
    func performDrop(info: DropInfo) -> Bool
    {
        return true
    }
    
    func dropEntered(info: DropInfo)
    {
        guard let draggedComponent = currentDraggedComponent
        else
        {
            return
        }

        if draggedComponent != component
        {
            guard let from = selectableComponents.firstIndex(of: draggedComponent),
                  let to   = selectableComponents.firstIndex(of: component)
            else
            {
                return
            }
        
            withAnimation(.default)
            {
                Swift.debugPrint("INFO: Moving component from: \(from), to: \(to).")
                
                self.selectableComponents.move(
                    fromOffsets: IndexSet(integer: from),
                    toOffset:    to > from ? to + 1 : to
                )
            }
        }
    }
}
