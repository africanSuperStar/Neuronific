//
//  Button.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/30.
//

import SwiftUI


extension Button : ParsedView
{
    public static func parse(_ json: JSONParser) throws -> Button<Label>
    {
        throw ViewError.failedToInitializeView
    }
}
