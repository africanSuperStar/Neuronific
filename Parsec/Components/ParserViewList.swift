//
//  ComponentViewList.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/14.
//

import SwiftUI


public struct ParserView : View
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
    func buildView(parser: JSONParser) -> some View
    {
        switch parser["view"].string
        {
        case "Text":
            Text(parser: parser)
    
        default:
            EmptyView()
        }
    }
}
