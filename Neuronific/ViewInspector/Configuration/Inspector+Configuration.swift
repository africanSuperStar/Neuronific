//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  Inspector+Configuration.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/02/21.
//

import AppKit

public struct InspectorConfiguration
{
    public var appearance: Appearance = .init()

//    public var keyCommands: KeyCommandSettings = .init()

    public var snapshotExpirationTimeInterval: TimeInterval

    public var showAllViewSearchQuery: String

    public var nonInspectableClassNames: [String]

    public let enableLayoutSubviewsSwizzling: Bool

    public var verbose: Bool

    public init(
        snapshotExpiration: TimeInterval = 1,
        showAllViewSearchQuery: String = "*",
        nonInspectableClassNames: [String] = [],
        enableLayoutSubviewsSwizzling: Bool = false,
        verbose: Bool = false
    ) {
        self.snapshotExpirationTimeInterval = snapshotExpiration
        self.showAllViewSearchQuery = showAllViewSearchQuery
        self.nonInspectableClassNames = nonInspectableClassNames
        self.enableLayoutSubviewsSwizzling = enableLayoutSubviewsSwizzling
        self.verbose = verbose
    }

    public static let `default` = InspectorConfiguration()

//    var colorStyle: InspectorColorStyle {
//        guard let keyWindow = Inspector.host?.keyWindow else { return .dark }
//
//        if #available(iOS 13.0, *) {
//            switch (keyWindow.overrideUserInterfaceStyle, keyWindow.traitCollection.userInterfaceStyle) {
//            case (.dark, _),
//                 (.unspecified, .dark):
//                return .dark
//            default:
//                return .light
//            }
//        }
//
//        return .dark
//    }

    let knownSystemContainers: [String] = [
        "UIEditingOverlayViewController",
        "UIWindow",
        "UITransitionView",
        "UIDropShadowView",
        "UILayoutContainerView",
        // Navigaiton
        "UIViewControllerWrapperView",
        "UINavigationTransitionView",
        // Swift UI
        "_UIHostingView",
        "PlatformViewHost",
        "PlatformGroupContainer",
        "HostingScrollView"
    ]
}
