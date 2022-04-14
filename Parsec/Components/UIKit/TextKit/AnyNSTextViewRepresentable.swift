//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  AnyNSTextViewRepresentable.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2022/04/14.
//

import AppKit

final class AnyNSTextViewRepresentable: NSView
{
    private var parser:     JSONParser
    private var font:       NSFont?
    
    weak var delegate: NSTextViewDelegate?
    
    var text: String {
        didSet {
            textView.string = textContentStorage?.string ?? ""
        }
    }
    
    var selectedRanges: [NSValue] = [] {
        didSet {
            guard selectedRanges.count > 0 else {
                return
            }
            
            textView.selectedRanges = selectedRanges
        }
    }
    
    private lazy var textContentStorage = try? NSTextStorage.parse(parser)
    
    private lazy var scrollView: NSScrollView = {
        let scrollView = NSScrollView()
        scrollView.drawsBackground = true
        scrollView.borderType = .noBorder
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalRuler = false
        scrollView.autoresizingMask = [.width, .height]
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var textView: NSTextView = {
        let contentSize = scrollView.contentSize
        
        let layoutManager = NSLayoutManager()
        textContentStorage?.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: scrollView.frame.size)
        textContainer.widthTracksTextView = true
        textContainer.containerSize = NSSize(
            width: contentSize.width,
            height: CGFloat.greatestFiniteMagnitude
        )
        layoutManager.addTextContainer(textContainer)
        
        let textView                     = NSTextView(frame: .zero, textContainer: textContainer)
        textView.autoresizingMask        = .width
        textView.backgroundColor         = NSColor.textBackgroundColor
        textView.delegate                = self.delegate
        textView.drawsBackground         = true
        textView.font                    = self.font
        textView.isHorizontallyResizable = false
        textView.isVerticallyResizable   = true
        textView.maxSize                 = NSSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        textView.minSize                 = NSSize(width: 0, height: contentSize.height)
        textView.textColor               = NSColor.labelColor
        textView.allowsUndo              = true
        
        return textView
    }()
    
    // MARK: - Initializers
    
    init(parser: JSONParser, font: NSFont?)
    {
        self.parser     = parser
        self.font       = font
        self.text       = ""
                
        super.init(frame: .zero)

    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - NSView Lifecycle
    
    override func viewWillDraw()
    {
        super.viewWillDraw()
        
        setupScrollViewConstraints()
        setupTextView()
    }
    
    func setupScrollViewConstraints()
    {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    func setupTextView()
    {
        scrollView.documentView = textView
    }
}
