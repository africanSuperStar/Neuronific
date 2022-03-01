//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSAttributedStringView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import AppKit
import SwiftUI

public struct NSAttributedStringView : NSViewRepresentable
{
    public var attributedString: NSMutableAttributedString

    private let label: NSTextField

    init(_ attributedString: NSMutableAttributedString)
    {
        self.attributedString = attributedString
        
        label = NSTextField(labelWithAttributedString: attributedString)
        
        label.isEditable         = false
        label.isSelectable       = false
    }
    
    public func makeNSView(context: Context) -> NSView
    {
        label
    }

    public func updateNSView(_ nsView: NSView, context: Context)
    {
        guard let view = nsView as? NSTextField else { return }
        
        view.attributedStringValue = attributedString
    }
}

extension NSAttributedStringView : Equatable { }
