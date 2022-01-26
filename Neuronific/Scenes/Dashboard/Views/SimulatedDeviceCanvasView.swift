//
//  SimulatedDeviceCanvasView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/25.
//

import SwiftUI


struct SimulatedDeviceCanvasView : View
{
    @EnvironmentObject
    private var model: AnyDragModel
    
    @State
    private var location: CGPoint = .zero
    
    var body: some View
    {
        Canvas(renderer: renderer)
        {
            ForEach(model.modifiableComponents)
            {
                component in
                
                component.view
                    .tag(component.id)
            }
        }
        .gesture(
            DragGesture(minimumDistance: .zero, coordinateSpace: .local)
                .onChanged
                {
                    gesture in
                    
                    location = CGPoint(
                        x: gesture.location.x,
                        y: gesture.location.y
                    )
                }
                .onEnded
                {
                    gesture in
                    
                    model.currentDraggedComponent?.location = CGPoint(
                        x: gesture.translation.width,
                        y: gesture.translation.height
                    )
                }
        )
    }
    
    func renderer(context: inout GraphicsContext, size: CGSize)
    {
        var unfocused = true
        
        for component in model.modifiableComponents
        {
            context.drawLayer
            {
                context in
                
                if let resolved = context.resolveSymbol(id: component.id)
                {
                    if inRange(from: component.location, to: location) && unfocused
                    {
                        component.location = location
                        
                        unfocused = false
                    }
                    
                    context.draw(resolved, at: component.location, anchor: .center)
                }
            }
        }
    }
    
    func inRange(from: CGPoint, to: CGPoint) -> Bool
    {
        return abs((from.x - to.x)) <= 30.0 && abs((from.y - to.y)) <= 45.0
    }
}

