//
//  JSONTreeView.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/02.
//

import SwiftUI

struct JSONTreeView : View
{
    var json: JSONRepresentable!
    
    var keyValues: [(key: String, value: AnyHashable)]

    init(_ dictionary: JSON)
    {
        self.keyValues = dictionary.sorted { $0.key < $1.key }
    }
    
    init(_ array: [JSON], prefix key: String = "")
    {
        self.keyValues = array.enumerated().map
        {
            (key: "\(key)[\($0.offset)]", value: $0.element)
        }
    }

    init(_ source: [(key: String, value: AnyHashable)])
    {
        self.keyValues = source
    }
    
    public var body: some View
    {
        ForEach(keyValues.indices, id: \.self)
        {
            index in
            
            VStack(alignment: .leading)
            {
                if index > 0
                {
                    Divider()
                }

                JSONCell(self.keyValues[index])
            }
        }
        .frame(minWidth: 40, maxWidth: 50, alignment: .leading)
    }
}

struct JSONTreeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        JSONTreeView([])
    }
}

// MARK: -

internal protocol JSONRepresentable
{
    var stringValue: String? { get }
}

extension JSONRepresentable
{
    var dataValue: Data?
    {
        do
        {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        }
        catch
        {
            return nil
        }
    }
    
    var stringValue: String?
    {
        do
        {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        }
        catch
        {
            return nil
        }
    }
}

extension Array: JSONRepresentable where Element: JSONRepresentable { }

extension JSON: JSONRepresentable { }

extension JSONTreeView
{
    internal init(_ json: JSONRepresentable, prefix key: String = "")
    {
        switch json
        {
        case let array as [JSON]:
            self.init(array, prefix: key)
        
        case let dictionary as JSON:
            self.init(dictionary)
        
        default:
            self.init(JSON())
        }

        self.json = json
    }
}
