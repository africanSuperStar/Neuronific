//
//  ModifierButtonData.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI
import Parsec

typealias ModifiedButton = ModifiedContent <Button <Image>, PrimitiveButtonModifier>

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
            // swiftlint:disable force_cast
            return Button<SwiftUI.Image>(data: "{}").tag(0) as! ModifiedButton
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
        
        guard let button = try? Button<SwiftUI.Image>(data: contents).modifyButton(JSONParser(data: contents))
        else
        {
            return rejectButton
        }
        
        // swiftlint:disable force_cast
        return button as! ModifiedButton
    }
}

struct Modifier
{
    @BundleFile(name: "Button", type: "json")
    static var buttonModifier: ModifiedButton
    
    @BundleFile(name: "ColorPicker", type: "json")
    static var colorPickerModifier: ModifiedButton
    
    @BundleFile(name: "DatePicker", type: "json")
    static var datePickerModifier: ModifiedButton
    
    @BundleFile(name: "DisclosureGroup", type: "json")
    static var disclosureModifier: ModifiedButton
    
    @BundleFile(name: "Form", type: "json")
    static var formModifier: ModifiedButton
    
    @BundleFile(name: "GroupBox", type: "json")
    static var groupBoxModifier: ModifiedButton
    
    @BundleFile(name: "HorizontalSplitView", type: "json")
    static var horizontalSplitViewModifier: ModifiedButton
    
    @BundleFile(name: "Label", type: "json")
    static var labelModifier: ModifiedButton
    
    @BundleFile(name: "Link", type: "json")
    static var linkModifier: ModifiedButton
    
    @BundleFile(name: "List", type: "json")
    static var listModifier: ModifiedButton
    
    static var modifiers: [(view: ModifiedButton, index: Int)]
    {
        return [
            (Modifier.buttonModifier,              0),
            (Modifier.colorPickerModifier,         1),
            (Modifier.datePickerModifier,          2),
            (Modifier.disclosureModifier,          3),
            (Modifier.formModifier,                4),
            (Modifier.groupBoxModifier,            5),
            (Modifier.horizontalSplitViewModifier, 6),
            (Modifier.labelModifier,               7),
            (Modifier.linkModifier,                8),
            (Modifier.listModifier,                9)
        ]
    }
}
