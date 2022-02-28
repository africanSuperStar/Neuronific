//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  LocalizationService.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/28.
//

import Foundation

class LocalizationService
{
    static let shared = LocalizationService()
    static let changedLanguage = Notification.Name("changedLanguage")

    private init() { }
    
    var language: Language
    {
        get
        {
            guard let languageString = UserDefaults.standard.string(forKey: "language")
            else
            {
                return .english_us
            }
            
            return Language(rawValue: languageString) ?? .english_us
        }
        
        set
        {
            if newValue != language
            {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
            
                NotificationCenter.default.post(
                    name:   LocalizationService.changedLanguage,
                    object: nil
                )
            }
        }
    }
}
