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
    var currentDraggedComponent: AnyDragComponent? = nil
    
    @Published
    var selectableComponents: [AnyDragComponent] = [
        TreeDragComponent(bindings: [
            (component:
                TextDragComponent(content: """
                {
                    "view": "Text",
                    "init": {
                        "description": "Component 1",
                        "content": "Component 1"
                    }
                }
                """),
             binding: .constant("")
            ),
            (component:
                TextDragComponent(content: """
                {
                    "view": "Text",
                    "init": {
                        "description": "Component 2",
                        "content": "Component 2"
                    }
                }
                """),
             binding: .constant("")
            ),
            (component:
                TextDragComponent(content: """
                {
                    "view": "Text",
                    "init": {
                        "description": "Component 3",
                        "content": "Component 3"
                    }
                }
                """),
             binding: .constant("")
            )
        ]),
        TextDragComponent(content: """
        {
            "view": "Text",
            "init": {
                "description": "Neuronific Picker",
                "content": "Hello World"
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
        """)
    ]
    
    @Published
    var selectedComponents: [AnyDragComponent] = [
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
