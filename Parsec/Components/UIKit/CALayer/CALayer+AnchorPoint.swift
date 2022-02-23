//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  CALayer+AnchorPoint.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/23.
//

import SwiftUI

public struct AnchorPoint : ViewModifier
{
    let json:      JSONParser
    var layerView: CALayerView
 
    init(json: JSONParser, layerView: CALayerView)
    {
        self.json      = json
        self.layerView = layerView
        
        self.layerView.layer = anchorPoint(json, layer: layerView.layer) ?? CALayer()
    }
    
    public func body(content: Content) -> some View
    {
        return layerView
    }
    
    @discardableResult
    public func anchorPoint(_ json: JSONParser, layer: CALayer) -> CALayer?
    {
        self.parse(json, layer: layer)
    }
    
    public func parse(_ json: JSONParser, layer: CALayer) -> CALayer?
    {
        debugPrint("SWIFTUI: ViewModifier -> AnchorPoint -> \(json)")
     
        var anchorPoint = CGPoint.zero
        
        if let x = json["x"].double, let y = json["y"].double
        {
            debugPrint("SWIFTUI: ViewModifier -> AnchorPoint -> x: \(x)")
            
            anchorPoint.x = x
            anchorPoint.y = y
            
            layer.anchorPoint = anchorPoint
            
            layer.bounds = CGRect(
                origin: anchorPoint,
                size:   CGSize(width: 50, height: 50)
            )
            
            layer.backgroundColor = NSColor.red.cgColor
            
            return layer
        }
        
        debugPrint(
            """
                SWIFTUI: Padding -> init -> not valid or more than one initializer,
                \(ViewModifierError.moreThanOneInitializer)
            """
        )
        
        return layer
    }
}
