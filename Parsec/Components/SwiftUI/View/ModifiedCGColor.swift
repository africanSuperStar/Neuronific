//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ModifiedCGColor.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/24.
//

import SwiftUI

public enum CGColorModifierTags : String, CaseIterable
{
    case rgba      = "RGBA"
    case grayscale = "Grayscale"
    case cmyk      = "CYMK"
    case grayGamma = "Gray Gamma 2.2"
    case sRGB      = "sRGB"
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

public struct AnyCGColor
{
    @discardableResult
    public func parseCGColor(
        _ modifier: JSONParser
    )
    -> CGColor?
    {
        guard let tag = modifier["colorSpace"].string else { return nil }
        
        switch CGColorModifierTags(tag)
        {
        case .rgba:
            return CGColor_RGBA(json: modifier).parse()
            
        case .grayscale:
            return CGColor_Grayscale(json: modifier).parse()
            
        case .cmyk:
            return CGColor_CMYK(json: modifier).parse()
            
        case .grayGamma:
            return CGColor_GrayGamma(json: modifier).parse()
            
        case .sRGB:
            return CGColor_sRGB(json: modifier).parse()
            
        default:
            return nil
        }
    }
}
