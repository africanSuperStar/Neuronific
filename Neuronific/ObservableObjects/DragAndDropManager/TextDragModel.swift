//
//  TextDragModel.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/05.
//

import SwiftUI
import Combine

class TextDragModel : ObservableObject
{
    public static let shared = TextDragModel()
 
    @Published var selectedTab = "tabs"
    
    @Published var selectableComponents: [TextDragComponent] = [
        TextDragComponent(content: """
        {
            "view": "Text",
            "init": {
                "description": "Brendon",
                "content": "Brendon",
                "localizedStringKey": null,
                "verbatim": null,
                "image": null,
                "date": null
            },
            "font": {
                "isCustom": null,
                "isBold": true,
                "isItalic": null,
                "isMonospacedDigit": true,
                "isSmallCaps": null,
                "isLowercaseSmallCaps": null,
                "isUppercaseSmallCaps": null,
                "leading": {
                    "init": {
                        "leading": null
                    }
                }
        
            }
        }
        """),
        TextDragComponent(content: """
        {
            "view": "Text",
            "init": {
                "description": "Astrocyte Logo",
                "content": null,
                "localizedStringKey": null,
                "verbatim": null,
                "image": "test",
                "date": null
            },
            "font": {
                "isCustom": null,
                "isBold": true,
                "isItalic": true,
                "isMonospacedDigit": true,
                "isSmallCaps": null,
                "isLowercaseSmallCaps": null,
                "isUppercaseSmallCaps": null,
                "leading": {
                    "init": {
                        "leading": null
                    }
                }
        
            }
        }
        """),
        TextDragComponent(content: """
        {
            "view": "Button",
            "init": {
                "label": "Hello World 2",
                "localizedStringKey": null,
                "action": {},
            },
            "style": {
                "bordered": true
            }
        }
        """),
        TextDragComponent(content: """
        {
            "view": "Button",
            "init": {
                "label": "Hello World",
                "localizedStringKey": null,
                "action": {},
            },
            "style": {
                "default": true
            }
        }
        """)
    ]
    
    @Published var selectedComponents: [TextDragComponent] = [
        TextDragComponent(content: """
        {
            "view": "Text",
            "init": {
                "content": "Hello World",
                "localizedStringKey": null,
                "verbatim": null,
                "image": null,
                "date": null
            },
            "font": {
                "isCustom": null,
                "isBold": null,
                "isItalic": null,
                "isMonospacedDigit": null,
                "isSmallCaps": null,
                "isLowercaseSmallCaps": null,
                "isUppercaseSmallCaps": null,
                "leading": {
                    "init": {
                        "leading": null
                    }
                }
        
            }
        }
        """)
    ]
    
}
