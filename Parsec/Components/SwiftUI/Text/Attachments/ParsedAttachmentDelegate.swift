//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ParsedAttachmentDelegate.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/03/08.
//

import SwiftUI
import Combine

// swiftlint:disable class_delegate_protocol
public protocol ParsedAttachmentDelegate : ParsedObjectDelegate
{
    func loadAttributedText() -> NSMutableAttributedString?
}

public class NSAttributedStringAttachment : ParsedAttachmentDelegate
{
    @Published
    var json: JSONParser
    
    @Published
    internal var attributedText = AnyNSAttributedString()
    
    internal var attachment: Binding <Data> = .constant(Data())
 
    required public init(json: JSONParser)
    {
        self.json = json
    }
    
    public func loadAttributedText() -> NSMutableAttributedString?
    {
        if let attributedString = attributedText.parse(json, attachment: attachment)
        {
            applyAttributes(attributedString)
    
            return attributedString
        }
        
        return nil
    }
    
    internal func applyAttributes(_ attributedString: NSMutableAttributedString)
    {
        if let attributes = json["stringAttributes"].array
        {
            for attribute in attributes
            {
                AnyViewNSAttributedString.parse(attribute, attributedString: attributedString)
            }
        }
    }
}

extension AnyViewNSAttributedString
{
    public static func parse(
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
