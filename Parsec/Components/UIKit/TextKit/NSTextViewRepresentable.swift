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

struct NSTextViewRepresentable : NSViewRepresentable
{
    var font: NSFont? = .systemFont(ofSize: 14, weight: .regular)
    
    var parser: JSONParser
    
    var onEditingChanged: () -> Void       = {}
    var onCommit        : () -> Void       = {}
    var onTextChange    : (String) -> Void = { _ in }
    
    func makeCoordinator() -> Coordinator
    {
        Coordinator(self)
    }
    
    func makeNSView(context: Context) -> AnyNSTextViewRepresentable
    {
        let textView = AnyNSTextViewRepresentable(
            parser: parser,
            font: font
        )
        
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateNSView(_ view: AnyNSTextViewRepresentable, context: Context)
    {
        view.selectedRanges = context.coordinator.selectedRanges
    }
}

extension NSTextViewRepresentable
{
    class Coordinator: NSObject, NSTextViewDelegate
    {
        var parent: NSTextViewRepresentable
        var selectedRanges: [NSValue] = []
        
        init(_ parent: NSTextViewRepresentable)
        {
            self.parent = parent
        }
    }
}

extension NSTextViewRepresentable : Equatable
{
    static func == (lhs: NSTextViewRepresentable, rhs: NSTextViewRepresentable) -> Bool
    {
        return lhs.parser["type"].string == rhs.parser["type"].string
    }
}
