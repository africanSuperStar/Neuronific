//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  JSONViewer.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/02.
//

import SwiftUI

typealias JSON = [String: AnyHashable]

struct JSONViewer : View
{
    private let rootArray:      [JSON]?
    private let rootDictionary: JSON

    init(_ array: [JSON])
    {
        self.rootArray      = array
        self.rootDictionary = JSON()
    }

    init(_ dictionary: JSON)
    {
        self.rootArray = nil
        self.rootDictionary = dictionary
    }

    init(url: URL)
    {
        do
        {
            let data     = try Data(contentsOf: url)
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            self.rootArray      = jsonData as? [JSON]
            self.rootDictionary = jsonData as? JSON ?? JSON()
        }
        catch
        {
            self.rootArray      = nil
            self.rootDictionary = JSON()
            
            print("JSONView error: \(error.localizedDescription)")
        }
    }

    var body: some View
    {
        ScrollView(.vertical, showsIndicators: true)
        {
            JSONTreeView(rootArray ?? rootDictionary)
                .padding([.top, .bottom], 10)
                .padding(.trailing, 10)
        }
    }
}

struct JSONViewer_Previews: PreviewProvider
{
    static var previews: some View
    {
        JSONViewer([])
    }
}
