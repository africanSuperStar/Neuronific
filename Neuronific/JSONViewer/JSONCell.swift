//
//  JSONCell.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/02.
//

import SwiftUI
import Combine

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
    }

    private func leafView(_ stringValue: String) -> some View
    {
        VStack(alignment: .leading, spacing: 4)
        {
            HStack(alignment: .center)
            {
                Text(key)
                Spacer()
            }

            TextField(stringValue.prefix(60), text: $editableRawValue)
                .lineSpacing(0)
                .foregroundColor(Color.gray)
                .contextMenu(ContextMenu(menuItems:
                {
                    Button
                    {
                        
                    } label: {
                        Label("Copy", systemImage: "copy")
                    }
                    Button
                    {
                        
                    } label: {
                        Label("Edit", systemImage: "copy")
                    }
                    Button
                    {
                        
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }))
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

