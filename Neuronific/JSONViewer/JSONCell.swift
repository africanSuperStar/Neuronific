//
//  JSONCell.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/02.
//

import SwiftUI
import Combine
import Parsec

#if !os(macOS)
import MobileCoreServices
#endif

struct JSONCell : View
{
    private let key: String

    @State private var editableRawValue: String = ""
    
    /// * note: According to [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization),
    /// acceptable values may be NSArray, NSDictionary, NSNumber, NSString or NSNull...
    private let rawValue: AnyHashable
    
    @State private var isOpen:   Bool = true
    @State private var isRotate: Bool = true

    @EnvironmentObject private var model: FileModel
    
    internal init(_ keyValue: (key: String, value: AnyHashable))
    {
        self.init(key: keyValue.key, value: keyValue.value)
    }

    init(key: String, value: AnyHashable)
    {
        self.rawValue = value
        self.key      = key
    }

    private func specificView() -> some View
    {
        switch rawValue
        {
        case let array as [JSON]: // NSArray
            return AnyView(keyValueView(treeView: JSONTreeView(array, prefix: key)))
        
        case let dictionary as JSON: // NSDictionary
            return AnyView(keyValueView(treeView: JSONTreeView(dictionary, prefix: key)))
        
        case let number as NSNumber: // NSNumber
            return AnyView(leafView(number.stringValue))
        
        case let string as String: // NSString
            return AnyView(leafView(string))
        
        case is NSNull: // NSNull
            return AnyView(leafView("null"))
        
        default:
            fatalError()
        }
    }

    var body: some View
    {
        NavigationView
        {
            specificView().padding(.leading, 10)
        }
        .frame(minWidth: 40, maxWidth: 50, alignment: .leading)
    }

    private func leafView(_ stringValue: String) -> some View
    {
        VStack(alignment: .leading, spacing: 4)
        {
            HStack(alignment: .center)
            {
                Text(key)
                    .contextMenu(ContextMenu(menuItems:
                    {
                        Button
                        {
                            if var _json = try? JSONSerialization.jsonObject(with: model.contents.data(using: .utf8) ?? Data(), options: []) as? [String: AnyObject]
                            {
                                if var _font = _json["font"] as? [String: AnyObject]
                                {
                                    _font[key]   = Bool(editableRawValue) as AnyObject?
                                    _json["font"] = _font                 as AnyObject?
                                }
                                
                                if var _init = _json["init"] as? [String: AnyObject]
                                {
                                    _init[key] = editableRawValue as AnyObject?
                                    _json["init"] = _init         as AnyObject?
                                }
                                
                                model.write(content: _json)
                            }
                            
                        } label: {
                            Label("Edit", image: "")
                        }
                        Button
                        {
                            
                        } label: {
                            Label("Delete", image: "")
                        }
                    }))
                Spacer()
            }

            TextField(stringValue.prefix(60), text: $editableRawValue)
                .lineSpacing(0)
                .foregroundColor(Color.gray)
                .onChange(of: editableRawValue, perform:
                {
                    value in
                })
        }
        .padding(.vertical, 5)
        .padding(.trailing, 10)
    }

    private func toggle()
    {
        self.isOpen.toggle()
    
        withAnimation(.linear(duration: 0.1))
        {
            self.isRotate.toggle()
        }
    }
    
    private func keyValueView(treeView valueView: JSONTreeView) -> some View
    {
        VStack(alignment: .leading)
        {
            Button(action: toggle)
            {
                HStack(alignment: .center)
                {
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .frame(width: 10, height: 10, alignment: .center)
                        .foregroundColor(Color.gray)
                        .rotationEffect(Angle(degrees: isRotate ? 90 : 0))
                    
                    Text(key)
                    Spacer()
                }
            }

            if isOpen
            {
                Divider()
                valueView
            }
        }
    }
}

