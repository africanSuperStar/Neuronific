//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyDragComponent.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

extension AnyDragComponent : Identifiable { }

public class AnyDragComponent :
    NSObject,
    AnyDragProtocol,
    ObservableObject,
    NSItemProviderWriting,
    NSItemProviderReading
{
    @GestureState
    public var dragAmount: CGSize = .zero
    
    @Published
    public var translation: CGPoint = .zero
    
    @Published
    public var attachment: Data = Data()
    
    var data: Data = Data()
    
    public var content:    String                = "{}"
    public var binding:    Binding <AnyHashable> = .constant("{}")
    
    required public convenience init(content: String, native: AnyView)
    {
        self.init()
        self.content = content
        self.native  = native
    }
    
    public var uuid: String
    {
        return parser["uuid"].string ?? ""
    }
    
    public var view: AnyView
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
    
    public lazy var native = AnyView(EmptyView())
    
    public var title: String
    {
        return parser["view"].string ?? ""
    }
    
    public static var writableTypeIdentifiersForItemProvider: [String]
    {
        ["network.thebonsai.neuronific.neuronificjson"]
    }
    
    public func loadData(
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
        
    public static var readableTypeIdentifiersForItemProvider: [String]
    {
        ["network.thebonsai.neuronific.neuronificjson"]
    }
        
    public static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self
    {
        guard let str = String(data: data, encoding: .utf8)
        else
        {
            throw CocoaError(CocoaError.Code.fileReadInapplicableStringEncoding)
        }
        
        return Self(content: str)
    }
}
