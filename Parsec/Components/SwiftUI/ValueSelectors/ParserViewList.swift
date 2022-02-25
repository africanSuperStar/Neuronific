//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ParserViewList.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI

public struct PickerViewList : View
{
    public var parsers: [JSONParser]
    
    public var body: some View
    {
        ForEach(parsers.indices, id: \.self)
        {
            index in
            
            buildView(parser: parsers[index])
        }
    }
    
    @ViewBuilder
    public func buildView(parser: JSONParser) -> some View
    {
        Label <Text, Image> (parser: parser)
    }
}
