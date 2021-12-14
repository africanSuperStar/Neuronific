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
            view = AnyView(Text(parser: parser))
            
        case "Picker":
            view = AnyView(Picker<Text, AnyHashable, ParserView>(parser: parser, binding))
    
        default:
            view = AnyView(EmptyView())
        }
    }
}

class AnyDragComponent : NSObject, NSItemProviderWriting, NSItemProviderReading
{
    let id = UUID().uuidString
    
    let content: String
    
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

