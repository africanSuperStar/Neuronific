//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  NSTextView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/04/13.
//

import AppKit
import SwiftUI

public struct NSTextViewRepresentable : NSViewRepresentable
{
    internal let textView:      NSTextView
    internal let textContainer: NSTextContainer

    init(_ textContainer: NSTextContainer)
    {
        self.textContainer = textContainer
        
        let cgRect = CGRect(
            origin: .zero,
            size: .init(
                width: textContainer.size.width,
                height: textContainer.size.height
            )
        )
        
        textView = NSTextView(frame: cgRect, textContainer: textContainer)
        textView.layoutManager?.allowsNonContiguousLayout = false
    }
    
    public func makeNSView(context: Context) -> NSView
    {
        textView
    }

    public func updateNSView(_ nsView: NSView, context: Context)
    {
    }
}

extension NSTextViewRepresentable : Equatable { }
