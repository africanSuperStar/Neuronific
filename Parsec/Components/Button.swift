//
//  Button.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/30.
//

import SwiftUI


extension Button : ParsedView
{
    public typealias Content = Self
    
    public static func parse <Content> (_ json: JSONParser) throws -> Content
    {
        throw ViewError.failedToInitializeView
    }
}
