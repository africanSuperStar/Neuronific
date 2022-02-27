//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyDropDelegate.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/21.
//

import SwiftUI
import UniformTypeIdentifiers
import Parsec

extension UTType
{
    public static var docx = UTType("network.thebonsai.neuronific.neuronificdocx")!
}

struct AnyDropDelegate : DropDelegate
{
    let component: AnyDragComponent

    let completionHandler: (AnyDragComponent) -> Void
    
    @EnvironmentObject
    var model: AnyDragModel
    
    func validateDrop(info: DropInfo) -> Bool
    {
        if info.hasItemsConforming(to: [.docx, .fileURL])
        {
            Swift.debugPrint("INFO: Item provider identifier for drop item: \(UTType.docx.identifier)")
            
            return true
        }
     
        Swift.debugPrint("WARNING: No Item provider identifier for drop item: \(UTType.docx.identifier)")
        
        return false
    }
    
    private func handleDropData(url: URL, handled: inout Bool) -> AnyDragComponent?
    {
        let bindingUUID = UUID().uuidString
        
        if let component = AnyDragComponent(url: url, binding: .constant(bindingUUID))
        {
            Swift.debugPrint("SUCCESS: Managed to validate drop of AnyDragComponent")

            handled = true
    
            return component
        }
        else
        {
            Swift.debugPrint("ERROR: Failed to validate drop of AnyDragComponent")

            handled = false
            
            return nil
        }
        
    }
    
    func performDrop(info: DropInfo) -> Bool
    {
        var handled = false
            
        if info.hasItemsConforming(to: [.fileURL])
        {
            Swift.debugPrint("INFO: Item provider identifier for drop item \(info.itemProviders(for: [.fileURL]))")
            
            let itemProviders = info.itemProviders(for: [.fileURL])
            
            for itemProvider in itemProviders
            {
                itemProvider.loadItem(
                    forTypeIdentifier: UTType.fileURL.identifier
                ) {
                    item, _ in
                    
                    guard let data = item as? Data,
                          let url  = URL(
                        dataRepresentation: data,
                        relativeTo: nil
                    )
                    else
                    {
                        return
                    }
                    
                    if let component = handleDropData(url: url, handled: &handled)
                    {
                        completionHandler(component)
                    }
                }
            }
        }
        else if info.hasItemsConforming(to: [.docx])
        {
            Swift.debugPrint("INFO: Item provider identifier for drop item \(info.itemProviders(for: [.docx]))")
            
            let itemProviders = info.itemProviders(for: [.docx])
            
            for itemProvider in itemProviders
            {
                itemProvider.loadDataRepresentation(
                    forTypeIdentifier: UTType.docx.identifier
                ) {
                    data, _ in
                    
                    guard let data = data,
                          let url  = URL(
                        dataRepresentation: data,
                        relativeTo: nil
                    )
                    else
                    {
                        return
                    }
                    
                    if let component = handleDropData(url: url, handled: &handled)
                    {
                        completionHandler(component)
                    }
                }
            }
        }

        return handled
    }
}
