//
//  ContentView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

import SwiftUI
import Parsec


struct ContentView: View
{
    let text = """
    {
        "view": "Text",
        "init": {
            "content": null,
            "key": {
                "localizedStringKey": "",
                "tableName": null,
                "bundle": null,
                "comment": null
            },
            "verbatim": "Hello World",
            "image": null,
            "date": null
        },
        "font": {
            "isCustom": null,
            "isBold": false,
            "isItalic": true,
            "isMonospacedDigit": null,
            "isSmallCaps": null,
            "isLowercaseSmallCaps": true,
            "isUppercaseSmallCaps": null,
            "leading": {
                "init": {
                    "leading": null
                }
            }
        }
    }
    """
    
    var body: some View
    {
        let text = try? Text(data: text)
        
        text
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
