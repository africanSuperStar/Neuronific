//
//  AnyDragModel.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/05.
//

import SwiftUI
import Combine
import Parsec

class AnyDragModel : ObservableObject
{
    public static let shared = AnyDragModel()

    @Published
    var focused: Bool = false
    
    @Published
    var currentDraggedComponent: AnyDragComponent?
    
    @Published
    var modifiableComponents: [AnyDragComponent] = []
    
    @Published
    var componentTranslations: [CGPoint] = []
    
    init() { }
}
