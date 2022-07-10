//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  TextKitViewSectionData.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/04/11.
//

import SwiftUI

enum TextKitSection : String, CaseIterable, Identifiable
{
    var id: String { rawValue }
    
    case nsTextContainer
}

struct TextKitViewSections : View
{
    @Binding var framework: Int
    
    fileprivate var sections: [(view: AnyView, tag: String)]
    {
        return TextKitSection.allCases.compactMap
        {
            section in

            switch section
            {
            case .nsTextContainer:
                return (view: AnyView(TextKitContainerViews()), tag: "nsTextContainers")
            }
        }
    }
    
    var body: some View
    {
        VStack
        {
            MenuablePopoverCardView(
                title:    "NSTextContainer Components",
                type:     "Options",
                sections: sections
            )
        
            Divider()
                .background(Theme.lightGray)
                .frame(maxWidth: .infinity, minHeight: 1.0)
        }
    }
}

struct TextKitViewSections_Previews: PreviewProvider
{
    static var previews: some View
    {
        TextKitViewSections(framework: .constant(0))
    }
}
