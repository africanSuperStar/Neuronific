//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyNSLayoutManager.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/27.
//

import SwiftUI

public enum AnyNSLayoutManagerConfigurationTags : String, CaseIterable
{
    case allowsNonContiguousLayout
    case showsInvisibleCharacters
    case showsControlCharacters
    case usesFontLeading
    case backgroundLayoutEnabled
    case limitsLayoutForSuspiciousContents
    case usesDefaultHyphenation
    
    init?(_ tag: String)
    {
        self.init(rawValue: tag)
    }
}

public struct AnyNSLayoutManagerConfiguration
{
    public func parse(
        _ modifier: JSONParser,
        manager: NSLayoutManager
    )
    -> NSLayoutManager
    {
        guard let tag = modifier["attribute"].string else { return manager }
        
        // swiftlint:disable orphaned_doc_comment
        switch AnyNSLayoutManagerConfigurationTags(tag)
        {
        /// If YES, then the layout manager may perform glyph generation and layout for a given portion
        /// of the text, without having glyphs or layout for preceding portions.  The default is NO.
        /// Turning this setting on will significantly alter which portions of the text will have glyph
        /// generation or layout performed when a given generation-causing method is invoked.
        /// It also gives significant performance benefits, especially for large documents.
        case .allowsNonContiguousLayout:
            manager.allowsNonContiguousLayout = modifier["value"].bool ?? false
            
        /// If YES, then whitespace and other "invisible" characters will be shown with special glyphs
        /// or other drawing.  The default is NO.
        /*********************** Global layout manager options ***********************/
        case .showsInvisibleCharacters:
            manager.showsInvisibleCharacters = modifier["value"].bool ?? false
            
        /// If YES, then control characters will be rendered visibly (usually like "^M").
        /// The default is NO.
        case .showsControlCharacters:
            manager.showsControlCharacters = modifier["value"].bool ?? false
            
        /// By default, a layout manager will use leading as specified by the font.  However, this is not
        /// appropriate for most UI text, for which a fixed leading is usually specified by UI layout
        /// guidelines.  These methods allow the use of the font's leading to be turned off.
        case .usesFontLeading:
            manager.usesFontLeading = modifier["value"].bool ?? true
            
        /// These methods allow you to set/query whether the NSLayoutManager will lay out text
        /// in the background, i.e. on the main thread when it is idle.  The default is YES, but this
        /// should be set to NO whenever the layout manager is being accessed from other threads.
        case .backgroundLayoutEnabled:
            manager.backgroundLayoutEnabled = modifier["value"].bool ?? true
            
        /// When YES, enables internal security analysis for malicious inputs and activates defensive
        /// behaviors. By enabling this functionality, it's possible certain text such as a very long paragraph
        /// might result in unexpected layout. NO by default.
        case .limitsLayoutForSuspiciousContents:
            manager.limitsLayoutForSuspiciousContents = modifier["value"].bool ?? false
            
        /// When YES, NSLayoutManager will attempt to hyphenate when wrapping lines. May be
        /// overridden on a per-paragraph basis by the NSParagraphStyle's hyphenationFactor.
        /// The receiver makes the best effort to decide the exact logic including the hyphenation
        /// factor based on the context. The default value is NO. Can be overridden by the preference
        /// key @"NSUsesDefaultHyphenation".
        case .usesDefaultHyphenation:
            manager.usesDefaultHyphenation = modifier["value"].bool ?? false
            
        default:
            break
        }
        
        return manager
    }
}
