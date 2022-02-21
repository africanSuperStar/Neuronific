//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  InspectorConfiguration+Appearance.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/21.
//

import AppKit

public extension InspectorConfiguration
{
    struct Appearance
    {
        // MARK: - Wireframe Style

        public var regularIconSize = CGSize(width: 20, height: 20)
        public var actionIconSize  = CGSize(width: 32, height: 32)

        public var elementIconSize = CGSize(
            width:  ElementInspector.appearance.verticalMargins * 3,
            height: ElementInspector.appearance.verticalMargins * 3
        )

        public lazy var highlightLayerBorderWidth: CGFloat = 2 / (NSScreen.main?.backingScaleFactor ?? .zero)
        public lazy var wireframeLayerBorderWidth: CGFloat = 1 / (NSScreen.main?.backingScaleFactor ?? .zero)

        // MARK: - Empty Layer Style

        public var emptyLayerBorderWidth: CGFloat = 0
    }
}
