//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  String+URL.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/28.
//

import Foundation

extension String
{
    var isValidURL: Bool
    {
        if let detector = try? NSDataDetector(
            types: NSTextCheckingResult.CheckingType.link.rawValue
        ),
        let match = detector.firstMatch(
            in:      self,
            options: [],
            range:   NSRange(location: 0, length: self.utf16.count)
        ) {
            return match.range.length == self.utf16.count
        }
        else
        {
            return false
        }
    }
}
