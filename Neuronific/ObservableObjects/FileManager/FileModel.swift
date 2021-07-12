//
//  FileModel.swift
//  Neuronific
//
//  Created by Cameron de Bruyn on 2021/05/04.
//

import Foundation
import Combine
import Parsec


class FileModel : ObservableObject
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
    
    @Published var contents: String = ""
    
    @Published var url = URL(string: "https://www.google.com")!
    
    init()
    {
        self.load(file: "text_view.json")
    }
    
    func write(content: [String: AnyObject])
    {
        if let data = try? JSONSerialization.data(withJSONObject: content, options: [.prettyPrinted])
        {
            try? data.write(to: url)
            
            load(file: "text_view.json")
        }
    }
    
    func load(file: String)
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        let filename  = paths[0].appendingPathComponent(file)
        self.url      = filename
        
        let contents  = try? String(contentsOf: self.url)
        self.contents = contents ?? ""
    }
}
