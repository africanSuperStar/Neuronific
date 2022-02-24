//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayerView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import AppKit
import SwiftUI

public struct CALayerView : NSViewRepresentable
{
    public var layer = CALayer()

    private let view = NSView()

    init()
    {
        view.wantsLayer = true
        view.layer?.addSublayer(layer)
        
        view.layer?.bounds = view.bounds
        
        // TODO: Remove, just for testing
        layer.backgroundColor = NSColor.red.cgColor
    }
    
    public func makeNSView(context: Context) -> NSView
    {
        view
    }

    public func updateNSView(_ nsView: NSView, context: Context) { }
}
