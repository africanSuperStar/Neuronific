//
//  ModifiedView.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/12/25.
//

import SwiftUI

extension View
{
    @ViewBuilder
    public func parseModifiers(_ json: JSONParser) -> some View
    {
        self
            .parseAccessibilityLabel(json)
            .parseAccessibilityInputLabels(json)
            .parseForegroundColor(json)
    }
}

