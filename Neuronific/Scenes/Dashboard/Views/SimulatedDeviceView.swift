//
//  SimulatedDeviceView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import SwiftUI

struct SimulatedDeviceView : View
{
    var body: some View
    {
        HStack(alignment: .center)
        {
            Color.blue
                .border(Color.black, width: 7)
        }
        .aspectRatio(CGSize(width: 9, height: 19.5), contentMode: .fit)
        .cornerRadius(Theme.cornerRadius)
        .shadow(radius: 10)
        .border(Color.white, width: 1)
    }
}

struct SimulatedDeviceView_Previews : PreviewProvider
{
    static var previews: some View
    {
        SimulatedDeviceView()
    }
}
