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
            ForEach(
                Array(
                    zip(
                        model.modifiableComponents.indices,
                        model.modifiableComponents
                    )
                ),
                id: \.1
            ) {
                index, component in
                        
                component.view
                    .tag(component.uuid)
                    .offset(
                        x: model.componentTranslations[index].x,
                        y: model.componentTranslations[index].y
                    )
                    .gesture(
                        DragGesture(
                            minimumDistance: .zero,
                            coordinateSpace: .local
                        )
                        .onChanged
                        {
                            gesture in
                            
                            model.componentTranslations[index] = gesture.location
                        }
                        .onEnded
                        {
                            gesture in
                            
                            model.componentTranslations[index] = gesture.location
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

