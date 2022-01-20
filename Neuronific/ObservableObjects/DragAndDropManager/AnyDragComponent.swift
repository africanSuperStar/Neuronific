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

class AnyDragComponent : NSObject, AnyDragProtocol, NSItemProviderWriting, NSItemProviderReading
{
    @Published
    var hovered: Bool = false

    var content: String               = "{}"    
    var binding: Binding<AnyHashable> = .constant("{}")
    
    let id: String = UUID().uuidString
    
    required convenience init(native: AnyView)
    {
        self.init()
        self.native = native
    }
    
    var view: AnyView
    {
        get {
            return Self(
                content: content,
                binding: binding
            )
            .body()
        }
        
        set { }
    }
    
    lazy var native = AnyView(EmptyView())
    
    var title: String
    {
        return parser["view"].string ?? ""
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
            [weak self] in guard let this = self else { return }
            
            progress.completedUnitCount = 1
        
            let data = this.content.data(using: .utf8)
            
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