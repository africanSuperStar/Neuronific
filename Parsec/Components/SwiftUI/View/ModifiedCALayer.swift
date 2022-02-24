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
    case anchorPoint = "AnchorPoint"
    
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
     
        let subLayer = CALayerView()
        
        var view = AnyView(content)
        
        for layer in layers
        {
            view = parseCALayer(layer, content: view, layer: subLayer)
        }
        
        return AnyView(
            ZStack(alignment: .top)
            {
                view
                subLayer
            }
        )
    }
}

extension AnyViewCALayer
{
    @discardableResult
    public func parseCALayer(
        _ modifier: JSONParser,
        content:    AnyView,
        layer:      CALayerView
    )
    -> AnyView
    {
        guard let tag = modifier["tag"].string else { return content }
        
        switch CALayerModifierTags(tag)
        {
        case .anchorPoint:
            return AnyView(
                content.modifier(
                    AnchorPoint(json: modifier, layerView: layer)
                )
            )
            
        default:
            return content
        }
    }
}
