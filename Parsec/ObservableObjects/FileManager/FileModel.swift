//
//  This file is distributed under the same license as the NEURONIFIC (PTY) LTD package.
//  Copyright (c) 2022 and Confidential to NEURONIFIC (PTY) LTD. All rights reserved.
//
//  FileModel.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import Foundation
import Combine

public class FileModel : ObservableObject
{
    public static let shared = FileModel()
    
    var json: JSONParser = JSONParser._Object([:])
    {
        willSet
        {
            self.load(file: "text_view.json")
        }
        
        didSet
        {
            do
            {
                self.json = try JSONParser(data: contents)
            }
            catch let error as NSError
            {
                print(error.localizedDescription)
            }
        }
    }
    
    @Published public var contents: String = ""
    
    @Published public var url = URL(string: "https://www.google.com")!
    
    public init()
    {
        self.load(file: "text_view.json")
    }
    
    public func write(content: [String: AnyObject])
    {
        if let data = try? JSONSerialization.data(withJSONObject: content, options: [.prettyPrinted])
        {
            try? data.write(to: url)
            
            load(file: "text_view.json")
        }
    }
    
    public func load(file: String)
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        let filename  = paths[0].appendingPathComponent(file)
        self.url      = filename
        
        let contents  = try? String(contentsOf: self.url)
        self.contents = contents ?? ""
    }
}
