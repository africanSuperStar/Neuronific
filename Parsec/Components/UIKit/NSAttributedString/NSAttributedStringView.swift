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
    public var attributedText = NSMutableAttributedString()

    private let view = NSTextView()

    init()
    {
        view.textStorage?.append(attributedText)
    }
    
    public func makeNSView(context: Context) -> NSView
    {
        view
    }

    public func updateNSView(_ nsView: NSView, context: Context) { }
}
