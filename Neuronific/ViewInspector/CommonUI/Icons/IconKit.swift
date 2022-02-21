//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  IconKit.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/21.
//

import AppKit

// swiftlint:disable type_body_length
class IconKit : NSObject
{
    // MARK: - Canvas Drawings

    /// Icons

    // swiftlint:disable function_body_length
    class func drawBorderStyleRoundedRect(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 16),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 20, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )

        context?.scaleBy(
            x: resizedFrame.width / 20,
            y: resizedFrame.height / 16
        )

        /// Icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 15.5, y: 0))
        
        icon.curve(
            to:            CGPoint(x: 20,    y: 4.5),
            controlPoint1: CGPoint(x: 17.99, y: 0),
            controlPoint2: CGPoint(x: 20,    y: 2.01)
        )
        
        icon.curve(
            to:            CGPoint(x: 15.5,  y: 9),
            controlPoint1: CGPoint(x: 20,    y: 6.99),
            controlPoint2: CGPoint(x: 17.99, y: 9)
        )
        
        icon.line(to: CGPoint(x: 4.5, y: 9))
        
        icon.curve(
            to:            CGPoint(x: 0,    y: 4.5),
            controlPoint1: CGPoint(x: 2.01, y: 9),
            controlPoint2: CGPoint(x: 0,    y: 6.99)
        )
        
        icon.curve(
            to:            CGPoint(x: 4.5, y: 0),
            controlPoint1: CGPoint(x: 0,   y: 2.01),
            controlPoint2: CGPoint(x: 2.01, y: 0)
        )
        
        icon.line(to: CGPoint(x: 15.5, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 15.5, y: 1))
        
        icon.line(to: CGPoint(x: 4.5, y: 1))
        
        icon.curve(
            to:            CGPoint(x: 1,    y: 4.5),
            controlPoint1: CGPoint(x: 2.57, y: 1),
            controlPoint2: CGPoint(x: 1,    y: 2.57)
        )
        
        icon.curve(
            to:            CGPoint(x: 4.5,  y: 8),
            controlPoint1: CGPoint(x: 1,    y: 6.43),
            controlPoint2: CGPoint(x: 2.57, y: 8)
        )
        
        icon.line(to: CGPoint(x: 15.5, y: 8))
        
        icon.curve(
            to:            CGPoint(x: 19,    y: 4.5),
            controlPoint1: CGPoint(x: 17.43, y: 8),
            controlPoint2: CGPoint(x: 19,    y: 6.43)
        )
        
        icon.curve(
            to:            CGPoint(x: 15.5,  y: 1),
            controlPoint1: CGPoint(x: 19,    y: 2.57),
            controlPoint2: CGPoint(x: 17.43, y: 1)
        )
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 0, y: 4)
        
        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawBorderStyleBezel(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 16),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
       
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 20, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 20,
            y: resizedFrame.height / 16
        )

        /// Icon Shadow
        let iconShadow = NSBezierPath()
        
        iconShadow.move(
            to: CGPoint(x: 14, y: 0)
        )
        
        iconShadow.line(
            to: CGPoint(x: 14, y: 10)
        )
        
        iconShadow.line(
            to: CGPoint(x: 0, y: 10)
        )
        
        iconShadow.line(to: CGPoint.zero)
        
        iconShadow.line(
            to: CGPoint(x: 14, y: 0)
        )
        
        iconShadow.close()
        
        iconShadow.move(
            to: CGPoint(x: 13, y: 1)
        )
        
        iconShadow.line(
            to: CGPoint(x: 1, y: 1)
        )
        
        iconShadow.line(
            to: CGPoint(x: 1, y: 9)
        )
        
        iconShadow.line(
            to: CGPoint(x: 13, y: 9)
        )
        
        iconShadow.line(
            to: CGPoint(x: 13, y: 1)
        )
        
        iconShadow.close()
        
        context?.saveGState()
        context?.setAlpha(0.5)
        context?.beginTransparencyLayer(auxiliaryInfo: nil)
        
        do {
            context?.translateBy(x: 3, y: 4)
            
            NSColor.black.setFill()
            
            iconShadow.fill()
        }
        
        context?.endTransparencyLayer()
        context?.restoreGState()

        /// Icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 14, y: 0))
        
        icon.line(to: CGPoint(x: 14, y: 10))
        icon.line(to: CGPoint(x: 0, y: 10))
        icon.line(to: CGPoint.zero)
        icon.line(to: CGPoint(x: 14, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 13, y: 1))
        
        icon.line(to: CGPoint(x: 1, y: 1))
        icon.line(to: CGPoint(x: 1, y: 9))
        icon.line(to: CGPoint(x: 13, y: 9))
        icon.line(to: CGPoint(x: 13, y: 1))
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 3, y: 3)

        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    class func drawBorderStyleLine(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 16),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 20, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 20,
            y: resizedFrame.height / 16
        )

        /// Icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 14, y: 0))
        
        icon.line(to: CGPoint(x: 14, y: 9))
        icon.line(to: CGPoint(x: 0, y: 9))
        icon.line(to: CGPoint.zero)
        icon.line(to: CGPoint(x: 14, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 13, y: 1))
        
        icon.line(to: CGPoint(x: 1, y: 1))
        icon.line(to: CGPoint(x: 1, y: 8))
        icon.line(to: CGPoint(x: 13, y: 8))
        icon.line(to: CGPoint(x: 13, y: 1))
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 3, y: 3)
        
        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawBorderStyleNone(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 16),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 20, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 20,
            y: resizedFrame.height / 16
        )

        /// Icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 3, y: 8))
        
        icon.line(to: CGPoint(x: 3, y: 9))
        icon.line(to: CGPoint(x: 2, y: 9))
        icon.line(to: CGPoint(x: 2, y: 8))
        icon.line(to: CGPoint(x: 3, y: 8))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 5, y: 8))
        
        icon.line(to: CGPoint(x: 5, y: 9))
        icon.line(to: CGPoint(x: 4, y: 9))
        icon.line(to: CGPoint(x: 4, y: 8))
        icon.line(to: CGPoint(x: 5, y: 8))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 7, y: 8))
        
        icon.line(to: CGPoint(x: 7, y: 9))
        icon.line(to: CGPoint(x: 6, y: 9))
        icon.line(to: CGPoint(x: 6, y: 8))
        icon.line(to: CGPoint(x: 7, y: 8))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 9, y: 8))
        
        icon.line(to: CGPoint(x: 9, y: 9))
        icon.line(to: CGPoint(x: 8, y: 9))
        icon.line(to: CGPoint(x: 8, y: 8))
        icon.line(to: CGPoint(x: 9, y: 8))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 11, y: 8))
        
        icon.line(to: CGPoint(x: 11, y: 9))
        icon.line(to: CGPoint(x: 10, y: 9))
        icon.line(to: CGPoint(x: 10, y: 8))
        icon.line(to: CGPoint(x: 11, y: 8))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 1, y: 8))
        
        icon.line(to: CGPoint(x: 1, y: 9))
        icon.line(to: CGPoint(x: 0, y: 9))
        icon.line(to: CGPoint(x: 0, y: 8))
        icon.line(to: CGPoint(x: 1, y: 8))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 13, y: 8))
        
        icon.line(to: CGPoint(x: 13, y: 9))
        icon.line(to: CGPoint(x: 12, y: 9))
        icon.line(to: CGPoint(x: 12, y: 8))
        icon.line(to: CGPoint(x: 13, y: 8))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 1, y: 6))
        
        icon.line(to: CGPoint(x: 1, y: 7))
        icon.line(to: CGPoint(x: 0, y: 7))
        icon.line(to: CGPoint(x: 0, y: 6))
        icon.line(to: CGPoint(x: 1, y: 6))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 13, y: 6))
        
        icon.line(to: CGPoint(x: 13, y: 7))
        icon.line(to: CGPoint(x: 12, y: 7))
        icon.line(to: CGPoint(x: 12, y: 6))
        icon.line(to: CGPoint(x: 13, y: 6))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 1, y: 4))
        
        icon.line(to: CGPoint(x: 1, y: 5))
        icon.line(to: CGPoint(x: 0, y: 5))
        icon.line(to: CGPoint(x: 0, y: 4))
        icon.line(to: CGPoint(x: 1, y: 4))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 13, y: 4))
        
        icon.line(to: CGPoint(x: 13, y: 5))
        icon.line(to: CGPoint(x: 12, y: 5))
        icon.line(to: CGPoint(x: 12, y: 4))
        icon.line(to: CGPoint(x: 13, y: 4))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 1, y: 2))
        
        icon.line(to: CGPoint(x: 1, y: 3))
        icon.line(to: CGPoint(x: 0, y: 3))
        icon.line(to: CGPoint(x: 0, y: 2))
        icon.line(to: CGPoint(x: 1, y: 2))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 13, y: 2))
        
        icon.line(to: CGPoint(x: 13, y: 3))
        icon.line(to: CGPoint(x: 12, y: 3))
        icon.line(to: CGPoint(x: 12, y: 2))
        icon.line(to: CGPoint(x: 13, y: 2))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 1, y: 0))
        
        icon.line(to: CGPoint(x: 1, y: 1))
        icon.line(to: CGPoint(x: 0, y: 1))
        icon.line(to: CGPoint.zero)
        icon.line(to: CGPoint(x: 1, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 3, y: 0))
        
        icon.line(to: CGPoint(x: 3, y: 1))
        icon.line(to: CGPoint(x: 2, y: 1))
        icon.line(to: CGPoint(x: 2, y: 0))
        icon.line(to: CGPoint(x: 3, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 5, y: 0))
        
        icon.line(to: CGPoint(x: 5, y: 1))
        icon.line(to: CGPoint(x: 4, y: 1))
        icon.line(to: CGPoint(x: 4, y: 0))
        icon.line(to: CGPoint(x: 5, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 7, y: 0))
        
        icon.line(to: CGPoint(x: 7, y: 1))
        icon.line(to: CGPoint(x: 6, y: 1))
        icon.line(to: CGPoint(x: 6, y: 0))
        icon.line(to: CGPoint(x: 7, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 9, y: 0))
        
        icon.line(to: CGPoint(x: 9, y: 1))
        icon.line(to: CGPoint(x: 8, y: 1))
        icon.line(to: CGPoint(x: 8, y: 0))
        icon.line(to: CGPoint(x: 9, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 11, y: 0))
        
        icon.line(to: CGPoint(x: 11, y: 1))
        icon.line(to: CGPoint(x: 10, y: 1))
        icon.line(to: CGPoint(x: 10, y: 0))
        icon.line(to: CGPoint(x: 11, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 13, y: 0))
        
        icon.line(to: CGPoint(x: 13, y: 1))
        icon.line(to: CGPoint(x: 12, y: 1))
        icon.line(to: CGPoint(x: 12, y: 0))
        icon.line(to: CGPoint(x: 13, y: 0))
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 3, y: 3)
        
        icon.windingRule = .evenOdd
        
        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    class func drawTextAlignmentNatural(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 16),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 16, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 16,
            y: resizedFrame.height / 16
        )

        /// icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 4, y: 0))
        
        icon.line(to: CGPoint(x: 4, y: 1))
        icon.line(to: CGPoint(x: 0, y: 1))
        icon.line(to: CGPoint.zero)
        icon.line(to: CGPoint(x: 4, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 9, y: 0))
        
        icon.line(to: CGPoint(x: 9, y: 1))
        icon.line(to: CGPoint(x: 5, y: 1))
        icon.line(to: CGPoint(x: 5, y: 0))
        icon.line(to: CGPoint(x: 9, y: 0))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 0))
        
        icon.line(to: CGPoint(x: 14, y: 1))
        icon.line(to: CGPoint(x: 10, y: 1))
        icon.line(to: CGPoint(x: 10, y: 0))
        icon.line(to: CGPoint(x: 14, y: 0))
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 1, y: 7)
        
        icon.windingRule = .evenOdd
        
        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    class func drawTextAlignmentJustified(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 16),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 16, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 16,
            y: resizedFrame.height / 16
        )

        /// icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 14, y: 6))
        
        icon.line(to: CGPoint(x: 14, y: 7))
        icon.line(to: CGPoint(x: 0, y: 7))
        icon.line(to: CGPoint(x: 0, y: 6))
        icon.line(to: CGPoint(x: 14, y: 6))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 4))
        
        icon.line(to: CGPoint(x: 14, y: 5))
        icon.line(to: CGPoint(x: 0, y: 5))
        icon.line(to: CGPoint(x: 0, y: 4))
        icon.line(to: CGPoint(x: 14, y: 4))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 2))
        
        icon.line(to: CGPoint(x: 14, y: 3))
        icon.line(to: CGPoint(x: 0, y: 3))
        icon.line(to: CGPoint(x: 0, y: 2))
        icon.line(to: CGPoint(x: 14, y: 2))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 0))
        
        icon.line(to: CGPoint(x: 14, y: 1))
        icon.line(to: CGPoint(x: 0, y: 1))
        icon.line(to: CGPoint.zero)
        icon.line(to: CGPoint(x: 14, y: 0))
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 1, y: 4)
        
        icon.windingRule = .evenOdd
        
        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawTextAlignmentRight(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 16),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 16, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 16,
            y: resizedFrame.height / 16
        )

        /// icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 14, y: 6))
        
        icon.line(to: CGPoint(x: 14, y: 7))
        icon.line(to: CGPoint(x: 2, y: 7))
        icon.line(to: CGPoint(x: 2, y: 6))
        icon.line(to: CGPoint(x: 14, y: 6))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 4))
        
        icon.line(to: CGPoint(x: 14, y: 5))
        icon.line(to: CGPoint(x: 0, y: 5))
        icon.line(to: CGPoint(x: 0, y: 4))
        icon.line(to: CGPoint(x: 14, y: 4))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 2))
        
        icon.line(to: CGPoint(x: 14, y: 3))
        icon.line(to: CGPoint(x: 3, y: 3))
        icon.line(to: CGPoint(x: 3, y: 2))
        icon.line(to: CGPoint(x: 14, y: 2))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 0))
        
        icon.line(to: CGPoint(x: 14, y: 1))
        icon.line(to: CGPoint(x: 0, y: 1))
        icon.line(to: CGPoint.zero)
        icon.line(to: CGPoint(x: 14, y: 0))
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 1, y: 4)
        
        icon.windingRule = .evenOdd
        
        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawTextAlignmentCenter(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 16),
        resizing:          ResizingBehavior = .aspectFit)
    {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
    
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 16, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 16,
            y: resizedFrame.height / 16
        )

        /// icon
        let icon = NSBezierPath()
        
        icon.move(to: CGPoint(x: 13, y: 6))
        
        icon.line(to: CGPoint(x: 13, y: 7))
        icon.line(to: CGPoint(x: 1, y: 7))
        icon.line(to: CGPoint(x: 1, y: 6))
        icon.line(to: CGPoint(x: 13, y: 6))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 4))
        
        icon.line(to: CGPoint(x: 14, y: 5))
        icon.line(to: CGPoint(x: 0, y: 5))
        icon.line(to: CGPoint(x: 0, y: 4))
        icon.line(to: CGPoint(x: 14, y: 4))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 12, y: 2))
        
        icon.line(to: CGPoint(x: 12, y: 3))
        icon.line(to: CGPoint(x: 2, y: 3))
        icon.line(to: CGPoint(x: 2, y: 2))
        icon.line(to: CGPoint(x: 12, y: 2))
        
        icon.close()
        
        icon.move(to: CGPoint(x: 14, y: 0))
        
        icon.line(to: CGPoint(x: 14, y: 1))
        icon.line(to: CGPoint(x: 0, y: 1))
        icon.line(to: CGPoint.zero)
        icon.line(to: CGPoint(x: 14, y: 0))
        
        icon.close()
        
        context?.saveGState()
        context?.translateBy(x: 1, y: 4)
        
        icon.windingRule = .evenOdd
        
        NSColor.black.setFill()
        icon.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawAppearanceDark(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 16),
        resizing:          ResizingBehavior = .aspectFit)
    {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
    
        let resizedFrame = resizing.apply(
            rect: CGRect(x: 0, y: 0, width: 16, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 16,
            y: resizedFrame.height / 16
        )

        /// Ultralight-S
        do {
            context?.saveGState()

            /// Shape
            let shape = NSBezierPath()
            
            shape.move(to: CGPoint(x: 7.87, y: 1.35))

            shape.curve(
                to:            CGPoint(x: 8.53, y: 0.68),
                controlPoint1: CGPoint(x: 8.23, y: 1.35),
                controlPoint2: CGPoint(x: 8.53, y: 1.05)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87, y: 0),
                controlPoint1: CGPoint(x: 8.53, y: 0.31),
                controlPoint2: CGPoint(x: 8.23, y: 0)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.19, y: 0.68),
                controlPoint1: CGPoint(x: 7.5,  y: 0),
                controlPoint2: CGPoint(x: 7.19, y: 0.31)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87, y: 1.35),
                controlPoint1: CGPoint(x: 7.19, y: 1.05),
                controlPoint2: CGPoint(x: 7.5,  y: 1.35)
            )

            shape.close()

            shape.move(to: CGPoint(x: 12.47, y: 3.26))

            shape.curve(
                to:            CGPoint(x: 13.42, y: 3.26),
                controlPoint1: CGPoint(x: 12.73, y: 3.52),
                controlPoint2: CGPoint(x: 13.17, y: 3.52)
            )
            
            shape.curve(
                to:            CGPoint(x: 13.42, y: 2.3),
                controlPoint1: CGPoint(x: 13.68, y: 3),
                controlPoint2: CGPoint(x: 13.68, y: 2.57)
            )
            
            shape.curve(
                to:            CGPoint(x: 12.47, y: 2.3),
                controlPoint1: CGPoint(x: 13.17, y: 2.04),
                controlPoint2: CGPoint(x: 12.73, y: 2.04)
            )
            
            shape.curve(
                to:            CGPoint(x: 12.47, y: 3.26),
                controlPoint1: CGPoint(x: 12.2,  y: 2.57),
                controlPoint2: CGPoint(x: 12.2,  y: 3)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 2.3, y: 3.26))
            
            shape.curve(
                to:            CGPoint(x: 3.25, y: 3.26),
                controlPoint1: CGPoint(x: 2.55, y: 3.52),
                controlPoint2: CGPoint(x: 3,    y: 3.52)
            )
            
            shape.curve(
                to:            CGPoint(x: 3.25, y: 2.3),
                controlPoint1: CGPoint(x: 3.52, y: 3),
                controlPoint2: CGPoint(x: 3.52, y: 2.57)
            )
            
            shape.curve(
                to:            CGPoint(x: 2.3, y: 2.3),
                controlPoint1: CGPoint(x: 3, y: 2.04),
                controlPoint2: CGPoint(x: 2.55, y: 2.04)
            )
            
            shape.curve(
                to:            CGPoint(x: 2.3,  y: 3.26),
                controlPoint1: CGPoint(x: 2.04, y: 2.57),
                controlPoint2: CGPoint(x: 2.04, y: 3)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 7.87, y: 11.69))
            
            shape.curve(
                to:            CGPoint(x: 11.69, y: 7.87),
                controlPoint1: CGPoint(x: 9.96,  y: 11.69),
                controlPoint2: CGPoint(x: 11.69, y: 9.96)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87,  y: 4.04),
                controlPoint1: CGPoint(x: 11.69, y: 5.77),
                controlPoint2: CGPoint(x: 9.96,  y: 4.04)
            )
            
            shape.curve(
                to:            CGPoint(x: 4.03, y: 7.87),
                controlPoint1: CGPoint(x: 5.76, y: 4.04),
                controlPoint2: CGPoint(x: 4.03, y: 5.77)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87, y: 11.69),
                controlPoint1: CGPoint(x: 4.03, y: 9.96),
                controlPoint2: CGPoint(x: 5.76, y: 11.69)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 7.87, y: 11.22))
            
            shape.curve(
                to:            CGPoint(x: 4.51, y: 7.87),
                controlPoint1: CGPoint(x: 6.03, y: 11.22),
                controlPoint2: CGPoint(x: 4.51, y: 9.7)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87, y: 4.51),
                controlPoint1: CGPoint(x: 4.51, y: 6.03),
                controlPoint2: CGPoint(x: 6.03, y: 4.51)
            )
            
            shape.curve(
                to:            CGPoint(x: 11.21, y: 7.87),
                controlPoint1: CGPoint(x: 9.69, y: 4.51),
                controlPoint2: CGPoint(x: 11.21, y: 6.03)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87, y: 11.22),
                controlPoint1: CGPoint(x: 11.21, y: 9.7),
                controlPoint2: CGPoint(x: 9.69, y: 11.22)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 0.68, y: 8.54))
            
            shape.curve(
                to:            CGPoint(x: 1.35, y: 7.87),
                controlPoint1: CGPoint(x: 1.05, y: 8.54),
                controlPoint2: CGPoint(x: 1.35, y: 8.23)
            )
            
            shape.curve(
                to:            CGPoint(x: 0.68, y: 7.19),
                controlPoint1: CGPoint(x: 1.35, y: 7.5),
                controlPoint2: CGPoint(x: 1.05, y: 7.19)
            )
            
            shape.curve(
                to:            CGPoint(x: 0,    y: 7.87),
                controlPoint1: CGPoint(x: 0.31, y: 7.19),
                controlPoint2: CGPoint(x: 0,    y: 7.5)
            )
            
            shape.curve(
                to:            CGPoint(x: 0.68, y: 8.54),
                controlPoint1: CGPoint(x: 0,    y: 8.23),
                controlPoint2: CGPoint(x: 0.31, y: 8.54)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 15.04, y: 8.54))
            
            shape.curve(
                to:            CGPoint(x: 15.72, y: 7.87),
                controlPoint1: CGPoint(x: 15.41, y: 8.54),
                controlPoint2: CGPoint(x: 15.72, y: 8.23)
            )
            
            shape.curve(
                to:            CGPoint(x: 15.04, y: 7.2),
                controlPoint1: CGPoint(x: 15.72, y: 7.5),
                controlPoint2: CGPoint(x: 15.41, y: 7.2)
            )
            
            shape.curve(
                to:            CGPoint(x: 14.38, y: 7.87),
                controlPoint1: CGPoint(x: 14.67, y: 7.2),
                controlPoint2: CGPoint(x: 14.38, y: 7.5)
            )
            
            shape.curve(
                to:            CGPoint(x: 15.04, y: 8.54),
                controlPoint1: CGPoint(x: 14.38, y: 8.23),
                controlPoint2: CGPoint(x: 14.67, y: 8.54)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 2.3, y: 13.43))
            
            shape.curve(
                to:            CGPoint(x: 3.25, y: 13.43),
                controlPoint1: CGPoint(x: 2.55, y: 13.68),
                controlPoint2: CGPoint(x: 3,    y: 13.68)
            )
            
            shape.curve(
                to:            CGPoint(x: 3.25, y: 12.47),
                controlPoint1: CGPoint(x: 3.52, y: 13.17),
                controlPoint2: CGPoint(x: 3.52, y: 12.73)
            )
            
            shape.curve(
                to:            CGPoint(x: 2.3,  y: 12.47),
                controlPoint1: CGPoint(x: 3,    y: 12.21),
                controlPoint2: CGPoint(x: 2.55, y: 12.21)
            )
            
            shape.curve(
                to:            CGPoint(x: 2.3,  y: 13.43),
                controlPoint1: CGPoint(x: 2.04, y: 12.73),
                controlPoint2: CGPoint(x: 2.04, y: 13.17)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 12.47, y: 13.43))
            
            shape.curve(
                to:            CGPoint(x: 13.42, y: 13.43),
                controlPoint1: CGPoint(x: 12.72, y: 13.69),
                controlPoint2: CGPoint(x: 13.15, y: 13.69)
            )
            
            shape.curve(
                to:            CGPoint(x: 13.42, y: 12.48),
                controlPoint1: CGPoint(x: 13.68, y: 13.17),
                controlPoint2: CGPoint(x: 13.68, y: 12.73)
            )
            
            shape.curve(
                to:            CGPoint(x: 12.47, y: 12.48),
                controlPoint1: CGPoint(x: 13.15, y: 12.21),
                controlPoint2: CGPoint(x: 12.72, y: 12.21)
            )
            
            shape.curve(
                to:            CGPoint(x: 12.47, y: 13.43),
                controlPoint1: CGPoint(x: 12.2,  y: 12.73),
                controlPoint2: CGPoint(x: 12.2,  y: 13.17)
            )
            
            shape.close()
            
            shape.move(to: CGPoint(x: 7.87, y: 15.73))
            
            shape.curve(
                to:            CGPoint(x: 8.53, y: 15.05),
                controlPoint1: CGPoint(x: 8.23, y: 15.73),
                controlPoint2: CGPoint(x: 8.53, y: 15.42)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87, y: 14.38),
                controlPoint1: CGPoint(x: 8.53, y: 14.69),
                controlPoint2: CGPoint(x: 8.23, y: 14.38)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.19, y: 15.05),
                controlPoint1: CGPoint(x: 7.5,  y: 14.38),
                controlPoint2: CGPoint(x: 7.19, y: 14.69)
            )
            
            shape.curve(
                to:            CGPoint(x: 7.87, y: 15.73),
                controlPoint1: CGPoint(x: 7.19, y: 15.42),
                controlPoint2: CGPoint(x: 7.5,  y: 15.73)
            )
            
            shape.close()
            
            context?.saveGState()
            context?.translateBy(x: 0.18, y: 0.1)
            
            NSColor.black.setFill()
            shape.fill()
            
            context?.restoreGState()
            context?.restoreGState()
        }

        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawAppearanceMedium(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 16),
        resizing:                   ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 16, height: 16),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 16,
            y: resizedFrame.height / 16
        )

        /// Shape
        let shape = NSBezierPath()
        
        shape.move(to: CGPoint(x: 8, y: 2.04))
        
        shape.curve(
            to:            CGPoint(x: 9.03, y: 1.02),
            controlPoint1: CGPoint(x: 8.56, y: 2.04),
            controlPoint2: CGPoint(x: 9.03, y: 1.58)
        )
        
        shape.curve(
            to:            CGPoint(x: 8, y: 0),
            controlPoint1: CGPoint(x: 9.03, y: 0.46),
            controlPoint2: CGPoint(x: 8.57, y: 0)
        )
        
        shape.curve(
            to:            CGPoint(x: 6.98, y: 1.02),
            controlPoint1: CGPoint(x: 7.43, y: 0),
            controlPoint2: CGPoint(x: 6.98, y: 0.45)
        )
        
        shape.curve(
            to:            CGPoint(x: 8, y: 2.04),
            controlPoint1: CGPoint(x: 6.98, y: 1.57),
            controlPoint2: CGPoint(x: 7.45, y: 2.04)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 12.22, y: 3.78))
        
        shape.curve(
            to:            CGPoint(x: 13.66, y: 3.78),
            controlPoint1: CGPoint(x: 12.61, y: 4.18),
            controlPoint2: CGPoint(x: 13.26, y: 4.18)
        )
        
        shape.curve(
            to:            CGPoint(x: 13.66, y: 2.34),
            controlPoint1: CGPoint(x: 14.07, y: 3.38),
            controlPoint2: CGPoint(x: 14.07, y: 2.74)
        )
        
        shape.curve(
            to:            CGPoint(x: 12.22, y: 2.34),
            controlPoint1: CGPoint(x: 13.25, y: 1.93),
            controlPoint2: CGPoint(x: 12.62, y: 1.93)
        )
        
        shape.curve(
            to:            CGPoint(x: 12.22, y: 3.78),
            controlPoint1: CGPoint(x: 11.82, y: 2.74),
            controlPoint2: CGPoint(x: 11.82, y: 3.39)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 2.34, y: 3.79))
        
        shape.curve(
            to:            CGPoint(x: 3.78, y: 3.79),
            controlPoint1: CGPoint(x: 2.73, y: 4.19),
            controlPoint2: CGPoint(x: 3.38, y: 4.19)
        )
        
        shape.curve(
            to:            CGPoint(x: 3.78, y: 2.35),
            controlPoint1: CGPoint(x: 4.2,  y: 3.38),
            controlPoint2: CGPoint(x: 4.2,  y: 2.76)
        )
        
        shape.curve(
            to:            CGPoint(x: 2.34, y: 2.35),
            controlPoint1: CGPoint(x: 3.38, y: 1.94),
            controlPoint2: CGPoint(x: 2.74, y: 1.94)
        )
        
        shape.curve(
            to:            CGPoint(x: 2.34, y: 3.79),
            controlPoint1: CGPoint(x: 1.94, y: 2.75),
            controlPoint2: CGPoint(x: 1.94, y: 3.39)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 8, y: 12.15))
        
        shape.curve(
            to:            CGPoint(x: 12.14, y: 8.01),
            controlPoint1: CGPoint(x: 10.27, y: 12.15),
            controlPoint2: CGPoint(x: 12.14, y: 10.28)
        )
        
        shape.curve(
            to:            CGPoint(x: 8,     y: 3.88),
            controlPoint1: CGPoint(x: 12.14, y: 5.75),
            controlPoint2: CGPoint(x: 10.27, y: 3.88)
        )
        
        shape.curve(
            to:            CGPoint(x: 3.87, y: 8.01),
            controlPoint1: CGPoint(x: 5.74, y: 3.88),
            controlPoint2: CGPoint(x: 3.87, y: 5.75)
        )
        
        shape.curve(
            to:            CGPoint(x: 8,    y: 12.15),
            controlPoint1: CGPoint(x: 3.87, y: 10.28),
            controlPoint2: CGPoint(x: 5.74, y: 12.15)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 8, y: 10.56))
        
        shape.curve(
            to:            CGPoint(x: 5.46, y: 8.01),
            controlPoint1: CGPoint(x: 6.61, y: 10.56),
            controlPoint2: CGPoint(x: 5.46, y: 9.4)
        )
        
        shape.curve(
            to:            CGPoint(x: 8,    y: 5.47),
            controlPoint1: CGPoint(x: 5.46, y: 6.63),
            controlPoint2: CGPoint(x: 6.61, y: 5.47)
        )
        
        shape.curve(
            to:            CGPoint(x: 10.55, y: 8.01),
            controlPoint1: CGPoint(x: 9.39,  y: 5.47),
            controlPoint2: CGPoint(x: 10.55, y: 6.63)
        )
        
        shape.curve(
            to:            CGPoint(x: 8,     y: 10.56),
            controlPoint1: CGPoint(x: 10.55, y: 9.4),
            controlPoint2: CGPoint(x: 9.39,  y: 10.56)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 1.02, y: 9.03))
        
        shape.curve(
            to:            CGPoint(x: 2.04, y: 8),
            controlPoint1: CGPoint(x: 1.58, y: 9.03),
            controlPoint2: CGPoint(x: 2.04, y: 8.56)
        )
        
        shape.curve(
            to:            CGPoint(x: 1.02, y: 6.98),
            controlPoint1: CGPoint(x: 2.04, y: 7.44),
            controlPoint2: CGPoint(x: 1.6,  y: 6.98)
        )
        
        shape.curve(
            to:            CGPoint(x: 0,    y: 8),
            controlPoint1: CGPoint(x: 0.46, y: 6.98),
            controlPoint2: CGPoint(x: 0,    y: 7.44)
        )
        
        shape.curve(
            to:            CGPoint(x: 1.02, y: 9.03),
            controlPoint1: CGPoint(x: 0,    y: 8.56),
            controlPoint2: CGPoint(x: 0.47, y: 9.03)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 14.98, y: 9.09))
        
        shape.curve(
            to:            CGPoint(x: 16,    y: 8.06),
            controlPoint1: CGPoint(x: 15.55, y: 9.09),
            controlPoint2: CGPoint(x: 16,    y: 8.63)
        )
        
        shape.curve(
            to:            CGPoint(x: 14.98, y: 7.04),
            controlPoint1: CGPoint(x: 16,    y: 7.51),
            controlPoint2: CGPoint(x: 15.53, y: 7.04)
        )
        
        shape.curve(
            to:            CGPoint(x: 13.96, y: 8.06),
            controlPoint1: CGPoint(x: 14.42, y: 7.04),
            controlPoint2: CGPoint(x: 13.96, y: 7.5)
        )
        
        shape.curve(
            to:            CGPoint(x: 14.98, y: 9.09),
            controlPoint1: CGPoint(x: 13.96, y: 8.62),
            controlPoint2: CGPoint(x: 14.42, y: 9.09)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 2.35, y: 13.66))
        
        shape.curve(
            to:            CGPoint(x: 3.79, y: 13.66),
            controlPoint1: CGPoint(x: 2.75, y: 14.07),
            controlPoint2: CGPoint(x: 3.39, y: 14.07)
        )
        
        shape.curve(
            to:            CGPoint(x: 3.79, y: 12.21),
            controlPoint1: CGPoint(x: 4.19, y: 13.26),
            controlPoint2: CGPoint(x: 4.19, y: 12.61)
        )
        
        shape.curve(
            to:            CGPoint(x: 2.35, y: 12.21),
            controlPoint1: CGPoint(x: 3.39, y: 11.82),
            controlPoint2: CGPoint(x: 2.74, y: 11.82)
        )
        
        shape.curve(
            to:            CGPoint(x: 2.35, y: 13.66),
            controlPoint1: CGPoint(x: 1.93, y: 12.62),
            controlPoint2: CGPoint(x: 1.93, y: 13.25)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 12.17, y: 13.7))
        
        shape.curve(
            to:            CGPoint(x: 13.62, y: 13.7),
            controlPoint1: CGPoint(x: 12.58, y: 14.11),
            controlPoint2: CGPoint(x: 13.2,  y: 14.11)
        )
        
        shape.curve(
            to:            CGPoint(x: 13.62, y: 12.26),
            controlPoint1: CGPoint(x: 14.02, y: 13.31),
            controlPoint2: CGPoint(x: 14.02, y: 12.66)
        )
        
        shape.curve(
            to:            CGPoint(x: 12.17, y: 12.26),
            controlPoint1: CGPoint(x: 13.21, y: 11.85),
            controlPoint2: CGPoint(x: 12.58, y: 11.85)
        )
        
        shape.curve(
            to:            CGPoint(x: 12.17, y: 13.7),
            controlPoint1: CGPoint(x: 11.77, y: 12.66),
            controlPoint2: CGPoint(x: 11.77, y: 13.3)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 8, y: 16))
        
        shape.curve(
            to:            CGPoint(x: 9.03, y: 14.98),
            controlPoint1: CGPoint(x: 8.57, y: 16),
            controlPoint2: CGPoint(x: 9.03, y: 15.54)
        )
        
        shape.curve(
            to:            CGPoint(x: 8,    y: 13.96),
            controlPoint1: CGPoint(x: 9.03, y: 14.42),
            controlPoint2: CGPoint(x: 8.56, y: 13.96)
        )
        
        shape.curve(
            to:            CGPoint(x: 6.98, y: 14.98),
            controlPoint1: CGPoint(x: 7.45, y: 13.96),
            controlPoint2: CGPoint(x: 6.98, y: 14.42)
        )
        
        shape.curve(
            to: CGPoint(x: 8, y: 16),
            controlPoint1: CGPoint(x: 6.98, y: 15.54),
            controlPoint2: CGPoint(x: 7.43, y: 16)
        )
        
        shape.close()
        
        context?.saveGState()
        
        NSColor.black.setFill()
        shape.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawSliderHorizontal(
        color:             NSColor = .black,
        frame targetFrame: CGRect  = CGRect(x: 0, y: 0, width: 24, height: 24),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect:   CGRect(x: 0, y: 0, width: 24, height: 24),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 24,
            y: resizedFrame.height / 24
        )

        /// Shape
        let shape = NSBezierPath()
        
        shape.move(to: CGPoint(x: 12.14, y: 4.49))
        
        shape.curve(
            to:            CGPoint(x: 14.25, y: 3.13),
            controlPoint1: CGPoint(x: 13.08, y: 4.49),
            controlPoint2: CGPoint(x: 13.9,  y: 3.93)
        )
        
        shape.line(to: CGPoint(x: 17.13, y: 3.13))
        
        shape.curve(
            to:            CGPoint(x: 18,   y: 2.24),
            controlPoint1: CGPoint(x: 17.6, y: 3.13),
            controlPoint2: CGPoint(x: 18,   y: 2.74)
        )
        
        shape.curve(
            to:            CGPoint(x: 17.13, y: 1.36),
            controlPoint1: CGPoint(x: 18,    y: 1.74),
            controlPoint2: CGPoint(x: 17.6,  y: 1.36)
        )
        
        shape.line(to: CGPoint(x: 14.25, y: 1.36))
        
        shape.curve(
            to: CGPoint(x: 12.14, y: 0),
            controlPoint1: CGPoint(x: 13.9, y: 0.56),
            controlPoint2: CGPoint(x: 13.08, y: 0)
        )
        
        shape.curve(
            to: CGPoint(x: 10.03, y: 1.36),
            controlPoint1: CGPoint(x: 11.19, y: 0),
            controlPoint2: CGPoint(x: 10.38, y: 0.56)
        )
        
        shape.line(to: CGPoint(x: 0.9, y: 1.36))
        
        shape.curve(
            to:            CGPoint(x: 0,   y: 2.24),
            controlPoint1: CGPoint(x: 0.4, y: 1.36),
            controlPoint2: CGPoint(x: 0,   y: 1.76)
        )
        
        shape.curve(
            to:            CGPoint(x: 0.9, y: 3.13),
            controlPoint1: CGPoint(x: 0,   y: 2.72),
            controlPoint2: CGPoint(x: 0.4, y: 3.13)
        )
        
        shape.line(to: CGPoint(x: 10.03, y: 3.13))
        
        shape.curve(
            to:            CGPoint(x: 12.14, y: 4.49),
            controlPoint1: CGPoint(x: 10.39, y: 3.93),
            controlPoint2: CGPoint(x: 11.19, y: 4.49)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 12.14, y: 3.25))
        
        shape.curve(
            to:            CGPoint(x: 11.11, y: 2.24),
            controlPoint1: CGPoint(x: 11.56, y: 3.25),
            controlPoint2: CGPoint(x: 11.11, y: 2.81)
        )
        
        shape.curve(
            to:            CGPoint(x: 12.14, y: 1.23),
            controlPoint1: CGPoint(x: 11.11, y: 1.67),
            controlPoint2: CGPoint(x: 11.56, y: 1.23)
        )
        
        shape.curve(
            to:            CGPoint(x: 13.18, y: 2.24),
            controlPoint1: CGPoint(x: 12.73, y: 1.23),
            controlPoint2: CGPoint(x: 13.18, y: 1.67)
        )
        
        shape.curve(
            to:            CGPoint(x: 12.14, y: 3.25),
            controlPoint1: CGPoint(x: 13.18, y: 2.81),
            controlPoint2: CGPoint(x: 12.73, y: 3.25)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 0.87, y: 6.61))
        
        shape.curve(
            to:            CGPoint(x: 0,   y: 7.51),
            controlPoint1: CGPoint(x: 0.4, y: 6.61),
            controlPoint2: CGPoint(x: 0,   y: 7.01)
        )
        
        shape.curve(
            to:            CGPoint(x: 0.87, y: 8.39),
            controlPoint1: CGPoint(x: 0,    y: 7.99),
            controlPoint2: CGPoint(x: 0.4,  y: 8.39)
        )
        
        shape.line(to: CGPoint(x: 3.78, y: 8.39))
        
        shape.curve(
            to:            CGPoint(x: 5.9,  y: 9.75),
            controlPoint1: CGPoint(x: 4.14, y: 9.19),
            controlPoint2: CGPoint(x: 4.95, y: 9.75)
        )
        
        shape.curve(
            to:            CGPoint(x: 8.01, y: 8.39),
            controlPoint1: CGPoint(x: 6.84, y: 9.75),
            controlPoint2: CGPoint(x: 7.65, y: 9.19)
        )
        
        shape.line(to: CGPoint(x: 17.1, y: 8.39))
        
        shape.curve(
            to:            CGPoint(x: 18,   y: 7.51),
            controlPoint1: CGPoint(x: 17.6, y: 8.39),
            controlPoint2: CGPoint(x: 18,   y: 7.99)
        )
        
        shape.curve(
            to:            CGPoint(x: 17.1, y: 6.61),
            controlPoint1: CGPoint(x: 18,   y: 7.01),
            controlPoint2: CGPoint(x: 17.6, y: 6.61)
        )
        
        shape.line(to: CGPoint(x: 8.01, y: 6.61))
        
        shape.curve(
            to:            CGPoint(x: 5.9,  y: 5.25),
            controlPoint1: CGPoint(x: 7.65, y: 5.81),
            controlPoint2: CGPoint(x: 6.84, y: 5.25)
        )
        
        shape.curve(
            to:            CGPoint(x: 3.78, y: 6.61),
            controlPoint1: CGPoint(x: 4.95, y: 5.25),
            controlPoint2: CGPoint(x: 4.14, y: 5.81)
        )
        
        shape.line(to: CGPoint(x: 0.87, y: 6.61))
        
        shape.close()
        
        shape.move(to: CGPoint(x: 5.9, y: 8.52))
        
        shape.curve(
            to:            CGPoint(x: 4.86, y: 7.51),
            controlPoint1: CGPoint(x: 5.32, y: 8.52),
            controlPoint2: CGPoint(x: 4.86, y: 8.07)
        )
        
        shape.curve(
            to:            CGPoint(x: 5.9, y: 6.48),
            controlPoint1: CGPoint(x: 4.86, y: 6.92),
            controlPoint2: CGPoint(x: 5.32, y: 6.48)
        )
        
        shape.curve(
            to:            CGPoint(x: 6.94, y: 7.51),
            controlPoint1: CGPoint(x: 6.49, y: 6.48),
            controlPoint2: CGPoint(x: 6.94, y: 6.92)
        )
        
        shape.curve(
            to:            CGPoint(x: 5.9, y: 8.52),
            controlPoint1: CGPoint(x: 6.94, y: 8.07),
            controlPoint2: CGPoint(x: 6.49, y: 8.52)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 12.14, y: 15))
        
        shape.curve(
            to:            CGPoint(x: 14.25, y: 13.64),
            controlPoint1: CGPoint(x: 13.08, y: 15),
            controlPoint2: CGPoint(x: 13.9,  y: 14.44)
        )
       
        shape.line(to: CGPoint(x: 17.13, y: 13.64))
        
        shape.curve(
            to:            CGPoint(x: 18,   y: 12.76),
            controlPoint1: CGPoint(x: 17.6, y: 13.64),
            controlPoint2: CGPoint(x: 18,   y: 13.24)
        )
        
        shape.curve(
            to:            CGPoint(x: 17.13, y: 11.87),
            controlPoint1: CGPoint(x: 18,    y: 12.26),
            controlPoint2: CGPoint(x: 17.6,  y: 11.87)
        )
        
        shape.line(to: CGPoint(x: 14.25, y: 11.87))
        
        shape.curve(
            to:            CGPoint(x: 12.14, y: 10.51),
            controlPoint1: CGPoint(x: 13.9,  y: 11.07),
            controlPoint2: CGPoint(x: 13.08, y: 10.51)
        )
        
        shape.curve(
            to:            CGPoint(x: 10.03, y: 11.87),
            controlPoint1: CGPoint(x: 11.19, y: 10.51),
            controlPoint2: CGPoint(x: 10.39, y: 11.07)
        )
        
        shape.line(to: CGPoint(x: 0.9, y: 11.87))
        
        shape.curve(
            to:            CGPoint(x: 0,   y: 12.76),
            controlPoint1: CGPoint(x: 0.4, y: 11.87),
            controlPoint2: CGPoint(x: 0,   y: 12.26)
        )
        
        shape.curve(
            to:            CGPoint(x: 0.9, y: 13.64),
            controlPoint1: CGPoint(x: 0,   y: 13.24),
            controlPoint2: CGPoint(x: 0.4, y: 13.64)
        )
        
        shape.line(to: CGPoint(x: 10.03, y: 13.64))
        
        shape.curve(
            to:            CGPoint(x: 12.14, y: 15),
            controlPoint1: CGPoint(x: 10.38, y: 14.44),
            controlPoint2: CGPoint(x: 11.19, y: 15)
        )
        
        shape.close()
        
        shape.move(to: CGPoint(x: 12.14, y: 13.77))
        
        shape.curve(
            to:            CGPoint(x: 11.11, y: 12.76),
            controlPoint1: CGPoint(x: 11.56, y: 13.77),
            controlPoint2: CGPoint(x: 11.11, y: 13.32)
        )
        shape.curve(
            to:            CGPoint(x: 12.14, y: 11.75),
            controlPoint1: CGPoint(x: 11.11, y: 12.18),
            controlPoint2: CGPoint(x: 11.56, y: 11.75)
        )
        shape.curve(
            to:            CGPoint(x: 13.18, y: 12.76),
            controlPoint1: CGPoint(x: 12.73, y: 11.75),
            controlPoint2: CGPoint(x: 13.18, y: 12.18)
        )
        shape.curve(
            to:            CGPoint(x: 12.14, y: 13.77),
            controlPoint1: CGPoint(x: 13.18, y: 13.32),
            controlPoint2: CGPoint(x: 12.73, y: 13.77)
        )
        
        shape.close()
        
        context?.saveGState()
        context?.translateBy(x: 3, y: 5)
        
        color.setFill()
        
        shape.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // swiftlint:disable function_body_length
    class func drawSetSquareFill(
        frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 24, height: 24),
        resizing:          ResizingBehavior = .aspectFit
    ) {
        /// General Declarations
        let context = NSGraphicsContext.current?.cgContext

        /// Resize to Target Frame
        context?.saveGState()
        
        let resizedFrame = resizing.apply(
            rect: CGRect(x: 0, y: 0, width: 24, height: 24),
            target: targetFrame
        )
        
        context?.translateBy(
            x: resizedFrame.minX,
            y: resizedFrame.minY
        )
        
        context?.scaleBy(
            x: resizedFrame.width / 24,
            y: resizedFrame.height / 24
        )

        /// SetSquare
        let setSquare = NSBezierPath()
        
        setSquare.move(to: CGPoint(x: 0.43, y: 0))
        
        setSquare.curve(
            to:            CGPoint(x: 0.74, y: 0.14),
            controlPoint1: CGPoint(x: 0.55, y: 0),
            controlPoint2: CGPoint(x: 0.66, y: 0.05)
        )
        
        setSquare.line(to: CGPoint(x: 13.9, y: 14.28))
        
        setSquare.curve(
            to:            CGPoint(x: 13.87, y: 14.88),
            controlPoint1: CGPoint(x: 14.06, y: 14.45),
            controlPoint2: CGPoint(x: 14.05, y: 14.72)
        )
        
        setSquare.curve(
            to:            CGPoint(x: 13.58, y: 15),
            controlPoint1: CGPoint(x: 13.79, y: 14.96),
            controlPoint2: CGPoint(x: 13.69, y: 15)
        )
        
        setSquare.line(to: CGPoint(x: 0.43, y: 15))
        
        setSquare.curve(
            to:            CGPoint(x: 0,    y: 14.57),
            controlPoint1: CGPoint(x: 0.19, y: 15),
            controlPoint2: CGPoint(x: 0,    y: 14.81)
        )
        
        setSquare.line(to: CGPoint(x: 0, y: 0.43))
        
        setSquare.curve(
            to:            CGPoint(x: 0.43, y: 0),
            controlPoint1: CGPoint(x: 0,    y: 0.19),
            controlPoint2: CGPoint(x: 0.19, y: 0)
        )
        
        setSquare.close()
        
        setSquare.move(to: CGPoint(x: 3, y: 5.99))
        
        setSquare.curve(
            to:            CGPoint(x: 2.57, y: 6.42),
            controlPoint1: CGPoint(x: 2.76, y: 5.99),
            controlPoint2: CGPoint(x: 2.57, y: 6.19)
        )
        
        setSquare.line(to: CGPoint(x: 2.57, y: 6.42))
        setSquare.line(to: CGPoint(x: 2.57, y: 11.96))
        
        setSquare.curve(
            to:            CGPoint(x: 3,    y: 12.39),
            controlPoint1: CGPoint(x: 2.57, y: 12.2),
            controlPoint2: CGPoint(x: 2.76, y: 12.39)
        )
        
        setSquare.line(to: CGPoint(x: 3, y: 12.39))
        setSquare.line(to: CGPoint(x: 8.54, y: 12.39))
        
        setSquare.curve(
            to:            CGPoint(x: 8.84, y: 12.26),
            controlPoint1: CGPoint(x: 8.65, y: 12.39),
            controlPoint2: CGPoint(x: 8.76, y: 12.34)
        )
        
        setSquare.curve(
            to:            CGPoint(x: 8.84, y: 11.66),
            controlPoint1: CGPoint(x: 9.01, y: 12.1),
            controlPoint2: CGPoint(x: 9.01, y: 11.82)
        )
        
        setSquare.line(to: CGPoint(x: 8.84, y: 11.66))
        setSquare.line(to: CGPoint(x: 3.3, y: 6.12))
        
        setSquare.curve(
            to:            CGPoint(x: 3,    y: 5.99),
            controlPoint1: CGPoint(x: 3.22, y: 6.04),
            controlPoint2: CGPoint(x: 3.11, y: 5.99)
        )
        
        setSquare.close()
        
        context?.saveGState()
        context?.translateBy(x: 5, y: 5)
        
        NSColor.black.setFill()
        setSquare.fill()
        
        context?.restoreGState()
        context?.restoreGState()
    }

    // MARK: - Resizing Behavior

    enum ResizingBehavior
    {
        case aspectFit  /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch    /// The content is stretched to match the entire target rectangle.
        case center     /// The content is centered in the target rectangle, but it is NOT resized.

        func apply(rect: CGRect, target: CGRect) -> CGRect
        {
            if rect == target || target == CGRect.zero
            {
                return rect
            }

            var scales = CGSize.zero
            
            scales.width  = abs(target.width  / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self
            {
            case .aspectFit:
                scales.width  = min(scales.width, scales.height)
                scales.height = scales.width
            
            case .aspectFill:
                scales.width  = max(scales.width, scales.height)
                scales.height = scales.width
                
            case .stretch:
                break
            
            case .center:
                scales.width  = 1
                scales.height = 1
            }

            var result = rect.standardized
            
            result.size.width  *= scales.width
            result.size.height *= scales.height
            
            result.origin.x = target.minX + (target.width  - result.width)  / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            
            return result
        }
    }
// swiftlint:disable file_length
}
