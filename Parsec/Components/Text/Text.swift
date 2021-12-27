//
//  TextView.swift
//  SwiftUIParsec
//
//  Created by Cameron de Bruyn on 2021/04/29.
//

import SwiftUI


extension Text
{
    public enum TextError: Error
    {
        case moreThanOneInitializer
    }
    
    public init?(url: URL)
    {
        if let data = try? Data(contentsOf: url)
        {
            self.init(data: data)
        }
        else
        {
            self.init("")
        }
    }
    
    public init?(data: Data)
    {
        self.init("")
        
        if  let string = String(data: data, encoding: .utf8),
            let parser = try? JSONParser(data: string)
        {
            do {
                self = try parseText(parser)
            }
            catch {  }
        }
    }
    
    public init?(parser: JSONParser)
    {
        self.init("")
        
        do {
            self = try parseText(parser)
        }
        catch {  }
    }
    
    public func parseText(_ json: JSONParser) throws -> Text
    {
        if let _view = json["view"].string,
        
        _view == "Text"
        {
            let initializerCount = Array(arrayLiteral:
                json["init"]["content"].string != nil,
                json["init"]["localizedStringKey"].string != nil,
                json["init"]["verbatim"].string != nil,
                json["init"]["image"].string != nil
            )
            
            if initializerCount.filter({ $0 == true }).count != 1
            {
                print("SWIFTUI: Text -> init -> more than 1 initializer")
                
                throw Text.TextError.moreThanOneInitializer
            }
            
            if let _content = json["init"]["content"].string, !_content.isEmpty
            {
                print("SWIFTUI: Text -> init -> content -> \(_content)")
                
                return Self(_content)
            }
            
            if let _key = json["init"]["localizedStringKey"].string, !_key.isEmpty
            {
                print("SWIFTUI: Text -> init -> localizedStringKey -> \(_key)")
    
                return Self(LocalizedString(_key))
            }
            
            if let _verbatim = json["init"]["verbatim"].string, !_verbatim.isEmpty
            {
                print("SWIFTUI: Text -> init -> verbatim -> \(_verbatim)")
    
                return Self(verbatim: _verbatim)
            }
            
            if let _image = json["init"]["image"].string, !_image.isEmpty
            {
                print("SWIFTUI: Text -> init -> image -> \(_image)")
    
                return Self(Image(_image))
            }
        }
        
        return Self("")
    }
}
