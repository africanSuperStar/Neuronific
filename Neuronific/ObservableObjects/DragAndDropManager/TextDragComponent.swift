//
//  DragAndDropManager.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/05.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

import Parsec


extension TextDragComponent : Identifiable { }

final class TextDragComponent : NSObject, NSItemProviderWriting, NSItemProviderReading
{
    let id = UUID().uuidString
    
    let content: String
    
    init(content: String)
    {
       self.content = content
    }
    
    @ViewBuilder
    var view: some View
    {
        if let data = content.data(using: .utf8)
        {
            Text(data: data)
        }
        else
        {
            EmptyView()            
        }
    }
       
    static var writableTypeIdentifiersForItemProvider: [String] { ["public.text"] }
    
    func loadData(
        withTypeIdentifier typeIdentifier: String,
        forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void
    )
    -> Progress?
    {
        let progress = Progress(totalUnitCount: 1)
        
        DispatchQueue.global(qos: .userInitiated).async
        {
            progress.completedUnitCount = 1
        
            let data = self.content.data(using: .utf8)
            
            completionHandler(data, nil)
        }
        
        return progress
    }
        
    static var readableTypeIdentifiersForItemProvider: [String] { ["public.text"] }
        
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> TextDragComponent
    {
        guard let str = String(data: data, encoding: .utf8)
            else
        {
            throw CocoaError(CocoaError.Code.fileReadInapplicableStringEncoding)
        }
        
        return TextDragComponent(content: str)
    }
}
