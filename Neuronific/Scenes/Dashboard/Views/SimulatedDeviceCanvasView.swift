//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  SimulatedDeviceCanvasView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/01/25.
//

import SwiftUI

struct SimulatedDeviceCanvasView : View
{
    @ObservedObject
    private var appModel = AppViewModel.shared
    
    @ObservedObject
    private var model = AnyDragModel.shared
    
    var body: some View
    {
        ZStack
        {
            ForEach($model.modifiableComponents, id: \.self)
            {
                $component in
                        
                component.view
                    .tag(component.uuid)
                    .offset(
                        x: component.translation.x,
                        y: component.translation.y
                    )
                    .gesture(
                        DragGesture(
                            minimumDistance: .zero,
                            coordinateSpace: .local
                        )
                        .onChanged
                        {
                            gesture in
                            
                            $component.translation.wrappedValue = gesture.location
                        }
                        .onEnded
                        {
                            gesture in
                            
                            $component.translation.wrappedValue = gesture.location
                        }
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .if(appModel.debugWindow)
        {
            view in
            
            view.rotation3DEffect(
                .degrees(60),
                axis: (x: .zero, y: 1.0, z: .zero)
            )
        }
    }
}
