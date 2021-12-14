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
    @StateObject private var model = AnyDragModel.shared
        
    let width:  CGFloat = 350
    let height: CGFloat = 350 / 9 * 19.5
    
    var body: some View
    {
        VStack(alignment: .center)
        {
            ForEach(model.selectedComponents, id: \.self)
            {
                component in
                
                component.view
            }
            .onDrop(
                of: ["public.text"],
                delegate: SimulatedDeviceViewDelegate(model: model)
            )
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

struct SimulatedDeviceViewDelegate: DropDelegate
{
    @ObservedObject var model: AnyDragModel

    func performDrop(info: DropInfo) -> Bool
    {
        guard info.hasItemsConforming(to: ["public.text"])
            else
        {
            return false
        }

        let items = info.itemProviders(for: ["public.text"])
        
        for item in items
        {
            _ = item.loadObject(ofClass: AnyDragComponent.self)
            {
                component, _ in
                
                if let component = component as? AnyDragComponent
                {
                    DispatchQueue.main.async
                    {
                        print("Inserting Component as 0")
                        print(String(describing: component.content))
                        
                        model.selectedComponents.insert(component, at: 0)
                    }
                }
            }
        }

        return true
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
