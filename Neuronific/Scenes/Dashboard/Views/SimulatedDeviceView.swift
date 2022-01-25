//
//  SimulatedDeviceView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI
import Combine


struct SimulatedDeviceView : View
{
    @EnvironmentObject
    private var model: AnyDragModel
    
    let width:  CGFloat = 390
    let height: CGFloat = 844
    
    var body: some View
    {
        ScrollView
        {
            LazyVStack(alignment: .center)
            {
                ForEach(model.modifiableComponents, id: \.self)
                {
                    component in
                    
                    component.view
                }
            }
        }
        .aspectRatio(width / height, contentMode: .fit)
        .overlay(
            RoundedRectangle(cornerRadius: Theme.cornerRadius)
                .stroke(Color.white, lineWidth: 4)
        )
        .cornerRadius(Theme.cornerRadius)
    }
    
}

struct SimulatedDeviceView_Previews : PreviewProvider
{
    static var previews: some View
    {
        SimulatedDeviceView()
            .environmentObject(AnyDragModel.shared)
    }
}
