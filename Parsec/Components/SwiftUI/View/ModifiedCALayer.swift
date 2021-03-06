//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ModifiedCALayer.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/23.
//

import SwiftUI

public enum CALayerModifierTags : String, CaseIterable
{
    case anchorPoint        = "CAAnchorPoint"
    case borderWidth        = "CABorderWidth"
    case borderColor        = "CABorderColor"
    case backgroundColor    = "CABackgroundColor"
    case cornerRadius       = "CACornerRadius"
    case maskToBounds       = "CAMaskToBounds"
    case maskedCorners      = "CAMaskedCorners"
    case shadowOffset       = "CAShadowOffset"
    case shadowColor        = "CAShadowColor"
    case shadowRadius       = "CAShadowRadius"
    case shadowOpacity      = "CAShadowOpacity"
    case isOpaque           = "CAOpaque"
    case opacity            = "CAOpacity"
    case shouldRasterize    = "CAShouldRasterize"
    case rasterizationScale = "CARasterizationScale"
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

extension View
{
    @ViewBuilder
    public func layer(_ json: JSONParser) -> some View
    {
        self.modifier(AnyViewCALayer(json: json))
    }
}

public struct AnyViewCALayer : ViewModifier
{
    let json: JSONParser
    
    public func body(content: Content) -> some View
    {
        anyCALayer(json, content: content)
    }
    
    @discardableResult
    public func anyCALayer(_ json: JSONParser, content: Content) -> AnyView
    {
        guard let layers = json["layers"].array else { return AnyView(content) }
     
        var view = CALayerView()
        
        for layer in layers
        {
            view.layer = parseCALayer(layer, view: view)
        }
        
        return AnyView(
            ZStack
            {
                content
                view
            }
        )
    }
}

extension AnyViewCALayer
{
    @discardableResult
    // swiftlint:disable cyclomatic_complexity
    public func parseCALayer(
        _ modifier: JSONParser,
        view:       CALayerView
    )
    -> CALayer
    {
        guard let tag = modifier["tag"].string else { return view.layer }
        
        switch CALayerModifierTags(tag)
        {
        case .anchorPoint:
            return CAAnchorPoint(json: modifier, view: view).parse()
            
        case .borderWidth:
            return CABorderWidth(json: modifier, view: view).parse()
            
        case .borderColor:
            return CABorderColor(json: modifier, view: view).parse()
            
        case .backgroundColor:
            return CABackgroundColor(json: modifier, view: view).parse()
        
        case .cornerRadius:
            return CACornerRadius(json: modifier, view: view).parse()
            
        case .maskToBounds:
            return CAMaskToBounds(json: modifier, view: view).parse()
            
        case .maskedCorners:
            return CAMaskedCorners(json: modifier, view: view).parse()
            
        case .shadowOffset:
            return CAShadowOffset(json: modifier, view: view).parse()
            
        case .shadowColor:
            return CAShadowColor(json: modifier, view: view).parse()
            
        case .shadowRadius:
            return CAShadowRadius(json: modifier, view: view).parse()
        
        case .shadowOpacity:
            return CAShadowOpacity(json: modifier, view: view).parse()
            
        case .isOpaque:
            return CAOpaque(json: modifier, view: view).parse()
            
        case .opacity:
            return CAOpacity(json: modifier, view: view).parse()
            
        case .shouldRasterize:
            return CAShouldRasterize(json: modifier, view: view).parse()
            
        case .rasterizationScale:
            return CARasterizationScale(json: modifier, view: view).parse()
            
        default:
            return view.layer
        }
    }
}
