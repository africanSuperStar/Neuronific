//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ElementInspector.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/21.
//

import AppKit

enum ElementInspector
{
    static var configuration = Configuration()
    static var appearance    = Appearance()
}

extension ElementInspector
{
    struct Configuration
    {
        var childrenListMaximumInteractiveDepth = 4

        var animationDuration: TimeInterval = CATransaction.animationDuration()

        var panelPreferredCompressedSize: CGSize
        {
            CGSize(
                width:   min(NSScreen.main?.frame.width ?? .zero, 414),
                height: .zero
            )
        }

        let panelSidePresentationAvailable: Bool = true

        var panelSidePresentationMinimumContainerSize: CGSize
        {
            CGSize(
                width:  768,
                height: 768
            )
        }

        var thumbnailBackgroundStyle: ThumbnailBackgroundStyle = .systemBackground

//        var defaultPanel: ElementInspectorPanel = .attributes
    }
}

extension ElementInspector
{
    struct Appearance
    {
        let horizontalMargins: CGFloat = 24

        let verticalMargins: CGFloat = 12

        let elementInspectorCornerRadius: CGFloat = 30

        var panelInitialTransform: CGAffineTransform
        {
            CGAffineTransform(
                scaleX: 0.99,
                y:      0.98
            )
            .translatedBy(
                x: .zero,
                y: -verticalMargins
            )
        }

        var directionalInsets: NSDirectionalEdgeInsets
        {
            NSDirectionalEdgeInsets(
                top:      verticalMargins   / 2,
                leading:  horizontalMargins / 2,
                bottom:   verticalMargins   / 2,
                trailing: horizontalMargins / 2
            )
        }

        func font(forRelativeDepth relativeDepth: Int) -> NSFont
        {
            NSFont.preferredFont(
                forTextStyle:
                {
                    switch relativeDepth
                    {
                    case let depth where depth <= -5:
                        return .title2
                    
                    case -4:
                        return .headline
                        
                    case -3:
                        return .subheadline
                    
                    case -2:
                        return .body
                    
                    case -1:
                        return .callout
                    
                    default:
                        return .footnote
                    }
                }()
            )
        }

        func titleFont(forRelativeDepth relativeDepth: Int) -> NSFont
        {
            font(forRelativeDepth: relativeDepth - 5)
        }
    }
}
