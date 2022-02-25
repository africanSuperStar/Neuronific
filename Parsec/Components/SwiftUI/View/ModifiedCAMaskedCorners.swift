//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ModifiedCAMaskedCorners.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/25.
//

import SwiftUI

public enum CACornerMaskModifierTags : String, CaseIterable
{
    case layerMaxXMaxYCorner
    case layerMaxXMinYCorner
    case layerMinXMaxYCorner
    case layerMinXMinYCorner
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

public struct AnyCACornerMask
{
    @discardableResult
    public func parseCACornerMask(
        _ modifier: JSONParser
    )
    -> CACornerMask?
    {
        guard let tag = modifier["cornerMask"].string else { return nil }
        
        switch CACornerMaskModifierTags(tag)
        {
        case .layerMaxXMaxYCorner:
            return CACornerMask.layerMaxXMaxYCorner
            
        case .layerMaxXMinYCorner:
            return CACornerMask.layerMaxXMinYCorner
            
        case .layerMinXMaxYCorner:
            return CACornerMask.layerMinXMaxYCorner
            
        case .layerMinXMinYCorner:
            return CACornerMask.layerMinXMinYCorner
            
        default:
            return nil
        }
    }
}
