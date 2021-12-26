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

class AnyDragComponent : NSObject, NSItemProviderWriting, NSItemProviderReading
{
    let id = UUID().uuidString
    
    var view: AnyView
    {
        guard let parser = try? JSONParser(data: content)
        else
        {
            return AnyView(EmptyView())
        }
        
        switch parser["view"].string
        {
        case "Text":
            return AnyView(
                TextDragComponent(
                    content: content,
                    binding: binding
                )?.body
            )
            
        case "Picker":
            return AnyView(
                PickerDragComponent(
                    content: content,
                    binding: binding
                )?.body
            )
    
        default:
            return AnyView(
                EmptyView()
            )
        }

    }
    
    var content: String
    var binding: Binding <AnyHashable> = .constant("")
    
    var parser: JSONParser
    {
        if let _parser = try? JSONParser(data: content)
        {
            return _parser
        }
        
        return try! JSONParser(data: "{}")
    }
    
    required init(content: String)
    {
        self.content = content
    }

    static var writableTypeIdentifiersForItemProvider: [String] { ["network.thebonsai.neuronific.neuronificjson"] }
    
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
        
    static var readableTypeIdentifiersForItemProvider: [String] { ["network.thebonsai.neuronific.neuronificjson"] }
        
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

extension AnyDragComponent
{
    convenience init?(content: String, binding: Binding <AnyHashable>)
    {
        self.init(content: content)
    }
    
    convenience init?(url: URL, binding: Binding <AnyHashable>)
    {
        if let _content = try? String(contentsOfFile: url.path, encoding: .utf8)
        {
            self.init(content: _content, binding: binding)
            
            return
        }
        
        self.init(content: "{}")
    }
}
