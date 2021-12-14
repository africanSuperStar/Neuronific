//
//  AnyDragModel.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/05.
//

import SwiftUI
import Combine

class AnyDragModel : ObservableObject
{
    public static let shared = AnyDragModel()
 
    @Published var selectedTab = "tabs"
    
    @Published var selectableComponents: [AnyDragComponent] = [
        TextDragComponent(content: """
        {
            "view": "Text",
            "init": {
                "description": "Brendon",
                "content": null,
                "localizedStringKey": null,
                "verbatim": null,
                "image": "test",
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
                "description": "Neuronific Picker",
                "content": "Hello World"
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
        PickerDragComponent(content: """
        {
            "view": "Picker",
            "init": {
                "title": "Neuronific Picker",
                "content": [{
                    "view": "Text",
                    "tag": "1",
                    "init": {
                        "image": "test"
                    }
                }, {
                    "view": "Text",
                    "tag": "2",
                    "init": {
                        "content": "Cameron de Bruyn"
                    }
                }, {
                    "view": "Text",
                    "tag": "3",
                    "init": {
                        "content": "Chazni Katz"
                    }
                }]
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
    
    @Published var selectedComponents: [AnyDragComponent] = [
        PickerDragComponent(content: """
        {
            "view": "Picker",
            "init": {
                "title": "Neuronific Picker",
                "content": [{
                    "view": "Text",
                    "tag": "1",
                    "init": {
                        "image": "test"
                    }
                }, {
                    "view": "Text",
                    "tag": "2",
                    "init": {
                        "content": "Cameron de Bruyn"
                    }
                }, {
                    "view": "Text",
                    "tag": "3",
                    "init": {
                        "content": "Chazni Katz"
                    }
                }]
            }
        }
        """)
    ]
    
}
