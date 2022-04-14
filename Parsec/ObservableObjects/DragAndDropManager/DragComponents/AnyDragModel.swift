//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyDragModel.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/05.
//

import SwiftUI
import Combine

public class AnyDragModel : ObservableObject
{
    public static let shared = AnyDragModel()
    
    @Published
    public var focused: Bool = false
    
    @Published
    public var currentDraggedComponent: AnyDragComponent?
    
    @Published
    public var modifiableComponents: [AnyDragComponent] = []
    
    @Published
    public var componentTranslations: [CGPoint] = []
    
    public init() { }
}
