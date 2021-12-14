//
//  ModifierButtonData.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI
import Parsec


typealias ModifiedButton = ModifiedContent <Button <Label <Text, Image>>, PrimitiveButtonModifier>

@propertyWrapper
struct BundleFile
{
    let name:        String
    let type:        String
    let fileManager: FileManager = .default
    let bundle:      Bundle = .main

    var wrappedValue: ModifiedButton
    {
        guard let modifier = try? PrimitiveButtonModifier(parser: JSONParser(data: "{}"))
        else
        {
            debugPrint("RESOURCE ERROR: Resource Modifier not found: \(name).\(type)")
            return Button(data: "{}").tag(0) as! ModifiedButton
        }
        
        let rejectButton = ModifiedButton(
            content:  Button(data: "{}"),
            modifier: modifier
        )
        
        guard let path = bundle.path(
            forResource: name,
            ofType:      type
        )
        else
        {
            debugPrint("RESOURCE ERROR: Resource not found: \(name).\(type)")
            return rejectButton
        }
        
        guard let data = fileManager.contents(atPath: path)
        else
        {
            debugPrint("RESOURCE ERROR: Cannot load file at: \(path)")
            return rejectButton
        }
        
        guard let contents = String(data: data, encoding: .utf8)
        else
        {
            debugPrint("RESOURCE ERROR: Cannot load contents of file at: \(path)")
            return rejectButton
        }
        
        guard let button = try? Button(data: contents).modifyButton(JSONParser(data: contents))
        else
        {
            return rejectButton
        }
        
        return button as! ModifiedButton
    }
}

struct Modifier
{
    @BundleFile(name: "Button", type: "json")
    static var buttonModifier: ModifiedButton
    
    static var modifiers: [(view: ModifiedButton, index: Int)]
    {
        get
        {
            return [
                (Modifier.buttonModifier, 0)
            ]
        }
    }
}
