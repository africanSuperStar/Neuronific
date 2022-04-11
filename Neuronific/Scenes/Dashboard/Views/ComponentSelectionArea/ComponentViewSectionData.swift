//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  ComponentViewSectionData.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/28.
//

import SwiftUI

enum Section : String, CaseIterable, Identifiable
{
    var id: String { rawValue }
    
    case framework
    case systemDefaultColors
    case searchFields
    case nsAttributedStrings
    case tableRows
    case colorPickers
}

struct ComponentViewSections : View
{
    @Binding var framework: Int
    
    fileprivate var sections: [(view: AnyView, tag: String)]
    {
        return Section.allCases.compactMap
        {
            section in

            switch section
            {
            case .framework:
                return (view: AnyView(
                        Group
                        {
                            Text("Select a UI Framework")
                            
                            Picker("", selection: $framework)
                            {
                                Text("UIKit").tag(0)
                                Text("SwiftUI").tag(1)
                            }
                            .pickerStyle(.segmented)
                            
                            Divider()
                                .background(Theme.lightGray)
                                .frame(maxWidth: .infinity, minHeight: 1.0)
                        }
                    ),
                    tag: "frameworks"
                )
                
            case .systemDefaultColors:
                return (view: AnyView(
                        Group
                        {
                            Text("System Default Colors")
                            
                            MultiColorCardViews()
                                .padding(.bottom)

                            Divider()
                                .background(Theme.lightGray)
                                .frame(maxWidth: .infinity, minHeight: 1.0)
                        }
                    ),
                    tag: "systemDefaultColors"
                )
            
            case .searchFields:
                return (view: AnyView(
                        Group
                        {
                            Text("Search Fields")
                            
                            SearchFieldViews()
                                .padding(.bottom)

                            Divider()
                                .background(Theme.lightGray)
                                .frame(maxWidth: .infinity, minHeight: 1.0)
                        }
                    ),
                    tag: "searchFields"
                )
                
            case .nsAttributedStrings:
                return (view: AnyView(
                        Group
                        {
                            Text("NSAttributedString Components")
                            
                            NSAttributedStringViews()
                                .padding(.bottom)

                            Divider()
                                .background(Theme.lightGray)
                                .frame(maxWidth: .infinity, minHeight: 1.0)
                        }
                    ),
                    tag: "nsAttributedStrings"
                )
                
            case .tableRows:
                return (view: AnyView(
                        Group
                        {
                            Text("Table Row Components")
                            
                            TableRowViews()
                            
                            Divider()
                                .background(Theme.lightGray)
                                .frame(maxWidth: .infinity, minHeight: 1.0)
                        }
                    ),
                    tag: "tableRows"
                )
                
            case .colorPickers:
                return (view: AnyView(
                        Group
                        {
                            Text("Color Pickers")
                            
                            ColorPickerViews()
                            
                            Divider()
                                .background(Theme.lightGray)
                                .frame(maxWidth: .infinity, minHeight: 1.0)
                        }
                    ),
                    tag: "colorPickers"
                )
            }
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    
    var body: some View
    {
        LazyVGrid(columns: columns, alignment: .leading)
        {
            ForEach(sections, id: \.tag)
            {
                $0.view
            }
        }
    }
}

struct ComponentViewSections_Previews: PreviewProvider
{
    static var previews: some View
    {
        ComponentViewSections(framework: .constant(0))
    }
}
