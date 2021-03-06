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

extension UTType
{
    public static var neuronific = UTType("network.thebonsai.neuronific.neuronificjson")!
}

public struct AnyDropDelegate : DropDelegate
{
    let component: AnyDragComponent

    let completionHandler: (AnyDragComponent) -> Void
    
    public init(
        component:         AnyDragComponent,
        completionHandler: @escaping (AnyDragComponent) -> Void
    ) {
        self.component         = component
        self.completionHandler = completionHandler
    }
    
    public func validateDrop(info: DropInfo) -> Bool
    {
        if info.hasItemsConforming(to: [.neuronific, .json, .fileURL])
        {
            Swift.debugPrint("INFO: Item provider identifier for drop item: \(UTType.neuronific.identifier)")
            
            return true
        }
     
        Swift.debugPrint("WARNING: No Item provider identifier for drop item: \(UTType.neuronific.identifier)")
        
        return false
    }
    
    private func handleDropData(url: URL, handled: inout Bool) -> AnyDragComponent?
    {
        let bindingUUID = UUID().uuidString
        
        Swift.debugPrint("URL for Drop Data: \(url.absoluteString)")
        
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
    
    private func handleDropData(content: String, handled: inout Bool) -> AnyDragComponent?
    {
        let bindingUUID = UUID().uuidString
        
        Swift.debugPrint("Content Bytes for Drop Data: \(content.lengthOfBytes(using: .utf8))")
        
        let component = AnyDragComponent(content: content, binding: .constant(bindingUUID))
        
        Swift.debugPrint("SUCCESS: Managed to validate drop of AnyDragComponent")

        handled = true

        return component
    }
    
    public func performDrop(info: DropInfo) -> Bool
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
                    item, error in
                    
                    if let error = error
                    {
                        // swiftlint:disable line_length
                        Swift.debugPrint("ERROR: Failed to form URL for Item Provider Identifier, \(error.localizedDescription)")
                        
                        return
                    }
                    
                    guard let data = item as? Data,
                          let url  = URL(
                        dataRepresentation: data,
                        relativeTo: nil
                    )
                    else
                    {
                        Swift.debugPrint("ERROR: Failed to form URL for Item Provider Identifier")
                        
                        return
                    }
                    
                    if let component = handleDropData(url: url, handled: &handled)
                    {
                        completionHandler(component)
                    }
                }
            }
        }
        else if info.hasItemsConforming(to: [.neuronific, .json])
        {
            Swift.debugPrint("INFO: Item provider identifier for drop item \(info.itemProviders(for: [.neuronific]))")
            
            let itemProviders = info.itemProviders(for: [.neuronific, .json])
            
            for itemProvider in itemProviders
            {
                itemProvider.loadDataRepresentation(
                    forTypeIdentifier: UTType.neuronific.identifier
                ) {
                    data, error in
                    
                    if let error = error
                    {
                        // swiftlint:disable line_length
                        Swift.debugPrint("ERROR: Failed to form URL for Item Provider Identifier, \(error.localizedDescription)")
                        
                        return
                    }

                    if let data    = data,
                       let content = String(data: data, encoding: .utf8)
                    {
                        if content.isValidURL
                        {
                            if let url       = URL(dataRepresentation: data, relativeTo: nil),
                               let component = handleDropData(url: url, handled: &handled)
                            {
                                completionHandler(component)
                                
                                return
                            }
                        }
                        else
                        {
                            if let component = handleDropData(content: content, handled: &handled)
                            {
                                completionHandler(component)
                                
                                return
                            }
                        }
                    }
                    
                    Swift.debugPrint("ERROR: Failed to form Component for Item Provider Identifier, \(itemProvider.debugDescription)")
                }
            }
        }
        
        Swift.debugPrint("INFO: Did handle drop data: \(handled)")

        return handled
    }
}
