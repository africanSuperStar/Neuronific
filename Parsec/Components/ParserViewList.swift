//
//  ComponentViewList.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI


public struct ParserViewList : View
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
        Label<Text, Image>(parser: parser)
    }
}
