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
    public static func attributedString(_ json: JSONParser) -> some View
    {
        AnyViewNSAttributedString(json: json)
    }
}

public struct AnyViewNSAttributedString : View
{
    let json: JSONParser
    
    @State
    private var attachment = Data()
 
    @State
    private var view = NSAttributedStringView(NSMutableAttributedString())
    
    public var body: some View
    {
        anyStringAttributes(json)
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
                        view
                        
                        if attachment.isEmpty
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
            
            return AnyView(view)
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
                
                attachment = docx
                reloadAttachment()
            }
        }
        else
        {
            return
        }
    }
    
    func reloadAttachment()
    {
        if let attributedString = AnyNSAttributedString().parse(json, attachment: $attachment)
        {
            view = NSAttributedStringView(attributedString)
            
            if let attributes = json["stringAttributes"].array
            {
                for attribute in attributes
                {
                    parse(attribute, attributedString: attributedString)
                }
            }
        }
    }
}

extension AnyViewNSAttributedString
{
    public func parse(
        _ modifier:       JSONParser,
        attributedString: NSMutableAttributedString
    ) {
        guard let tag = modifier["tag"].string else { return }
        
        switch NSAttributedStringModifierTags(tag)
        {
        case .dynamicFont:
            NSDynamicAttibutedFont(json: modifier, attributedString: attributedString).parse()
    
        case .font:
            NSCustomAttibutedFont(json: modifier, attributedString: attributedString).parse()
    
        default:
            return
        }
    }
}
