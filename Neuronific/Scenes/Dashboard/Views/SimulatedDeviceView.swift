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
    
    let width:  CGFloat = 350
    let height: CGFloat = 350 / 9 * 19.5
    
    var body: some View
    {
        VStack(alignment: .center)
        {
            ForEach(model.modifiableComponents, id: \.self)
            {
                component in
                
                component.view
            }
        }
        .padding()
        .frame(maxWidth: width, maxHeight: height, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: Theme.cornerRadius)
                .stroke(Color.white, lineWidth: 2)
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
