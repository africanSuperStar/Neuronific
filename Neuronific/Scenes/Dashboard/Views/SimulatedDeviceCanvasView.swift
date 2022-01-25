//
//  SimulatedDeviceCanvasView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/25.
//

import SwiftUI

struct SimulatedDeviceTimelineView : View
{
    @Binding var scale:      CGFloat
    @Binding var translateX: CGFloat
    @Binding var translateY: CGFloat
    
    var body: some View
    {
        TimelineView(.periodic(from: .now, by: 0.1))
        {
            timeline in
            
            SimulatedDeviceCanvasView(
                scale:      $scale,
                translateX: $translateX,
                translateY: $translateY
            )
        }
    }
}

struct SimulatedDeviceCanvasView : View
{
    @EnvironmentObject
    private var model: AnyDragModel
    
    @Binding var scale:      CGFloat
    @Binding var translateX: CGFloat
    @Binding var translateY: CGFloat
    
    var body: some View
    {
        Canvas(renderer: renderer)
        {
            ForEach(model.modifiableComponents)
            {
                component in
                
                component.view
                    .tag(component.id)
                    .scaleEffect(scale * 2)
                    .position(x: translateX * 200, y: translateY * 400)
            }
        }
    }
    
    func renderer(context: inout GraphicsContext, size: CGSize)
    {
        for component in model.modifiableComponents
        {
            context.drawLayer
            {
                context in
                
                if let resolved = context.resolveSymbol(id: component.id)
                {
                    let pt = CGPoint(
                        x: 0,
                        y: 0
                    )
                    
                    context.draw(resolved, at: pt, anchor: .top)
                }
            }
        }
    }
}

