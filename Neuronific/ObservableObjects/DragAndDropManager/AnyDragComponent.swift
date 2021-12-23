//
//  AnyDragComponent.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

import Parsec


extension AnyDragComponent : Identifiable { }

extension AnyDragComponent
{
    convenience init(content: String, binding: Binding <AnyHashable>)
    {
        self.init(content: content)

        guard let parser = try? JSONParser(data: content)
        else
        {
            view = AnyView(EmptyView())
            
            return
        }
        
        switch parser["view"].string
        {
        case "Text":
            view = TextDragComponent(
                content: content,
                binding: binding
            )
            .view
            
        case "Picker":
            view = PickerDragComponent(
                content: content,
                binding: binding
            )
            .view
    
        default:
            view = AnyView(
                EmptyView()
            )
        }
    }
    
    convenience init(url: URL, binding: Binding <AnyHashable>)
    {
        if let _content = try? String(contentsOfFile: url.path, encoding: .utf8)
        {
            self.init(content: _content, binding: binding)
            
            return
        }
        
        self.init(content: "{}")
    }
}

class AnyDragComponent : NSObject, NSItemProviderWriting, NSItemProviderReading
{
    let id = UUID().uuidString
    
    var content: String
    
    required init(content: String)
    {
        self.content = content
    }

    @ViewBuilder
    var view: AnyView
    {
        get
        {
            AnyView(EmptyView())
        }
        
        set { }
    }
       
    static var writableTypeIdentifiersForItemProvider: [String] { ["public.json", "public.fileURL"] }
    
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
        
    static var readableTypeIdentifiersForItemProvider: [String] { ["public.json", "public.fileURL"] }
        
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self
    {
        guard let str = String(data: data, encoding: .utf8)
        else
        {
            throw CocoaError(CocoaError.Code.fileReadInapplicableStringEncoding)
        }
        
        return Self(content: str)
    }
}

