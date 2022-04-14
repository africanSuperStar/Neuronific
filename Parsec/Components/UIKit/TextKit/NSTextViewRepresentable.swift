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
    @Binding var text: String
    
    var isEditable: Bool = true
    
    var font: NSFont? = .systemFont(ofSize: 14, weight: .regular)
    
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
            text: text,
            isEditable: isEditable,
            font: font
        )
        
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateNSView(_ view: AnyNSTextViewRepresentable, context: Context)
    {
        view.text = text
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
        
        func textDidBeginEditing(_ notification: Notification)
        {
            guard let textView = notification.object as? NSTextView
            else
            {
                return
            }
            
            self.parent.text = textView.string
            self.parent.onEditingChanged()
        }
        
        func textDidChange(_ notification: Notification)
        {
            guard let textView = notification.object as? NSTextView
            else
            {
                return
            }
            
            self.parent.text    = textView.string
            self.selectedRanges = textView.selectedRanges
        }
        
        func textDidEndEditing(_ notification: Notification)
        {
            guard let textView = notification.object as? NSTextView
            else
            {
                return
            }
            
            self.parent.text = textView.string
            self.parent.onCommit()
        }
    }
}

extension NSTextViewRepresentable : Equatable
{
    static func == (lhs: NSTextViewRepresentable, rhs: NSTextViewRepresentable) -> Bool
    {
        return lhs.text == rhs.text
    }
}
