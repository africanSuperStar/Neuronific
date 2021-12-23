//
//  LoadAnyOperation.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/23.
//

import SwiftUI
import Cocoa
import UniformTypeIdentifiers


class LoadAnyComponentOperation : Operation
{
    var directoryURL: URL!

    var loadedComponents = [AnyDragComponent]()
    
    override init()
    {
        let paths = NSSearchPathForDirectoriesInDomains(
            .downloadsDirectory,
            .userDomainMask,
            true
        )
    
        if let componentFolderPath = paths.first
        {
            let resolvedPath = NSString(string: componentFolderPath).resolvingSymlinksInPath
            
            directoryURL = URL(fileURLWithPath: resolvedPath)
        }
        
        super.init()
    }
    
    override var isAsynchronous: Bool { return true }
    
    override func main()
    {
        do {
            /** For the collection view content obtain all the component URLs
                in the Downloads folder and wrap them in AnyDragComponent objects.
            
                Note that this app requires sandbox read permissions to the Downloads folder, set in the app entitlements.
                Without it, error 257 will occur (no permission to view it).
            */
            let resourceValueKeys = [URLResourceKey.isRegularFileKey, URLResourceKey.typeIdentifierKey]
    
            let contents = try FileManager.default.contentsOfDirectory(
                at: directoryURL,
                includingPropertiesForKeys: resourceValueKeys,
                options: [
                    .skipsSubdirectoryDescendants,
                    .skipsHiddenFiles,
                    .skipsPackageDescendants
                ]
            )

            if !contents.isEmpty
            {
                for url in contents
                {
                    let resourceValues = try url.resourceValues(
                        forKeys: Set(
                            [.typeIdentifierKey, URLResourceKey.isRegularFileKey]
                        )
                    )
                    
                    guard let isRegularFileResourceValue = resourceValues.isRegularFile
                    else
                    {
                        continue
                    }
                    
                    guard isRegularFileResourceValue
                    else
                    {
                        continue
                    }
                    
                    guard let fileType = resourceValues.typeIdentifier
                    else
                    {
                        continue
                    }
                    
                    if #available(macOS 11.0, *)
                    {
                        guard let fileUTType = UTType(fileType)
                        else
                        {
                            continue
                        }
                        
                        guard fileUTType.conforms(to: UTType.json)
                        else
                        {
                            continue
                        }
                    }
                    else
                    {
                        guard UTTypeConformsTo(fileType as CFString, kUTTypeJSON)
                        else
                        {
                            continue
                        }
                    }
                    
                    let bindingUUID = UUID().uuidString
                    
                    let component = AnyDragComponent(url: url, binding: .constant(bindingUUID))
                    
                    // TODO: Figure out how to create a thumbnail image.
                    // jsonItem.loadImage()
                    
                    loadedComponents.append(component)
                }
            }
        } catch {
            // FileManager.default.contentsOfDirectory failed.
            Swift.debugPrint("\(error)")
        }
    }
    
}
