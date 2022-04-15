//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ModifiedNSAttributedString.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public enum NSAttributedStringModifierTags : String, CaseIterable
{
    case dynamicFont = "NSDynamicAttributedFont"
    case font        = "NSCustomAttributedFont"
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

extension Text
{
    @ViewBuilder
    public static func attributedText <T: NSAttributedStringAttachment> (_ json: JSONParser) -> some View
    {
        AnyViewNSAttributedString <T> (observed: T(json: json))
    }
    
    public static func attributedString <T: NSAttributedStringAttachment> (_ json: JSONParser) -> some NSAttributedString
    {
        AnyViewNSAttributedString <T> (observed: T(json: json)).nsAttributedString
    }
}

public struct AnyViewNSAttributedString <T: NSAttributedStringAttachment> : View
{
    @StateObject
    var model = AnyDragModel.shared
    
    @State
    private var attributedText: NSMutableAttributedString
    
    @ObservedObject
    var observed: T
    
    init(observed: T)
    {
        self.observed = observed
        
        attributedText = observed.loadAttributedText() ?? NSMutableAttributedString()
    }
    
    public var body: some View
    {
        anyStringAttributes(observed.json)
    }
    
    public var nsAttributedString: NSAttributedString
    {
        get {
            return NSAttributedString(attributedString: attributedText)
        }
    }
    
    @discardableResult
    public func anyStringAttributes(_ json: JSONParser) -> AnyView
    {
        if let tag = json["view"].string,
        
        tag == "AttributedText"
        {
            if let hasAttachments = json["hasAttachments"].bool,
                
            hasAttachments
            {
                return AnyView(
                    VStack
                    {
                        NSAttributedStringView(attributedText)
                        
                        if attributedText.string.isEmpty
                        {
                            Button
                            {
                                openFilePanel()
                                
                            } label: {
                                
                                Image(systemName: "doc.fill.badge.plus")
                                    .resizable()
                                    .frame(
                                        width:  30,
                                        height: 30
                                    )
                            }
                            .offset(x: .zero, y: -15.0)
                            .buttonStyle(CircularAddButtonStyle())
                            
                            Text("Add Document")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                    }
                )
            }
            else
            {
                return AnyView(
                    NSAttributedStringView(attributedText)
                )
            }
        }
        
        return AnyView(EmptyView())
    }
    
    private func openFilePanel()
    {
        let dialog = NSOpenPanel()
        
        dialog.title                   = "Choose a Document file"
        dialog.showsResizeIndicator    = true
        dialog.showsHiddenFiles        = false
        dialog.allowsMultipleSelection = false
        dialog.canChooseDirectories    = false
        dialog.allowedContentTypes     = [.data]
        
        if dialog.runModal() ==  NSApplication.ModalResponse.OK
        {
            let results = dialog.urls
            
            for result in results
            {
                let path: String = result.path
                
                Swift.debugPrint("INFO: Selected a Neuronific file with path: \(path)")
                
                guard let docx = try? Data(contentsOf: result.absoluteURL)
                else
                {
                    Swift.debugPrint("ERROR: Failed to decode MS Word File URL.")
                    return
                }
                
                observed.attachment = .constant(docx)
                
                if let attributedString = observed.loadAttributedText()
                {
                    attributedText = attributedString
                    
                    $model.modifiableComponents.forEach
                    {
                        if model.currentDraggedComponent?.uuid == $0.wrappedValue.uuid
                        {
                            $0.native.wrappedValue = AnyView(
                                AnyViewNSAttributedString(observed: observed)
                            )
                        }
                    }
                }
            }
        }
        else
        {
            return
        }
    }
}
