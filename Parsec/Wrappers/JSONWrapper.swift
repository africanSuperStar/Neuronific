//
//  JSONWrapper.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/13.
//

import Foundation

@propertyWrapper
struct JSONObject
{
    var wrappedValue : [AnyHashable : Any]
    {
        get
        {
            guard let _data = data,
                  let _json = try? JSONSerialization.jsonObject(
                with:    _data,
                options: .fragmentsAllowed
            ) as? [AnyHashable : Any]
            else
            {
                return [:]
            }
            
            return _json
        }
        
        set
        {
            data = try? JSONSerialization.data(
                withJSONObject: newValue,
                options:        .fragmentsAllowed
            )
        }
    }
    
    private var data: Data?
    
    init?(_ data: Data?)
    {
        self.data = data
    }
}
