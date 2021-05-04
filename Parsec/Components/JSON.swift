//
//  Parser.swift
//  SwiftUIParsec
//
//  Created by Cameron de Bruyn on 2021/05/01.
//

struct JSONParserCollection
{
    typealias ArrayType = [JSONParser]

    private var jsonParsers = ArrayType()

    init(jsonParsers: ArrayType)
    {
        self.jsonParsers = jsonParsers
    }
}

extension JSONParserCollection : Stream, Collection
{
    typealias ArrayLiteralElement = JSONParser
    
    typealias Index   = ArrayType.Index
    typealias Element = ArrayType.Element

    var startIndex: Index { return jsonParsers.startIndex }
    var endIndex:   Index { return jsonParsers.endIndex }

    init(arrayLiteral elements: JSONParser...)
    {
        self.jsonParsers = elements
    }

    subscript(index: Index) -> Iterator.Element
    {
        get { return jsonParsers[index] }
    }

    func index(after i: Index) -> Index
    {
        return jsonParsers.index(after: i)
    }
}

public enum JSONParser
{
    case _String(String)
    case _Number(Double)
    case _Bool(Bool)
    case _Null
    case _Array([JSONParser])
    case _Object([String: JSONParser])
    case Error
    
    public static let parser: GenericParser <String, (), JSONParser> = {
        
        let json   = LanguageDefinition<()>.json
        let lexer  = GenericTokenParser(languageDefinition: json)
        let symbol = lexer.symbol
        
        let stringLiteral = lexer.stringLiteral
        
        let jstring = JSONParser._String <^> stringLiteral
        let jnull = symbol("null") *> GenericParser(result: JSONParser._Null)
        
        let jnumber = JSONParser._Number <^>
            (lexer.float.attempt <|> lexer.integerAsFloat)
        
        let trueValue  = symbol("true")  *>  GenericParser(result: true)
        let falseValue = symbol("false") *>  GenericParser(result: false)
        let jbool      = JSONParser._Bool <^> (trueValue <|> falseValue)
        
        var jarray:  GenericParser <String, (), JSONParser>!
        var jobject: GenericParser <String, (), JSONParser>!
        
        let _ = GenericParser.recursive
        {
            (jvalue: GenericParser <String, (), JSONParser>) in
            
            let jarrayValues = lexer.commaSeparated(jvalue)
            
            jarray = JSONParser._Array <^> lexer.brackets(jarrayValues)
            
            let nameValue: GenericParser<String, (), (String, JSONParser)> = stringLiteral >>-
                {
                    name in
                    
                    symbol(":") *> jvalue.map { value in (name, value) }
                }
            
            let dictionary: GenericParser<String, (), [String: JSONParser]> = (symbol(",") *> nameValue).manyAccumulator
            {
                (assoc, dict) in
                
                var _dict = dict
                
                let (name, value) = assoc
                
                _dict[name] = value
                
                return _dict
                
            }
            
            let jobjectDict: GenericParser<String, (), [String: JSONParser]> = nameValue >>-
                {
                    assoc in
                    
                    dictionary >>-
                        {
                            (dict) in
                            
                            var _dict = dict
                            
                            let (name, value) = assoc
                            
                            _dict[name] = value
                            
                            return GenericParser(result: _dict)
                        }
                    
                }
            
            let jobjectValues = jobjectDict <|> GenericParser(result: [:])
            jobject = JSONParser._Object <^> lexer.braces(jobjectValues)
            
            return jstring <|> jnumber <|> jbool <|> jnull <|> jarray <|> jobject
        }
        
        return lexer.whiteSpace *> (jobject <|> jarray)
    }()
        
    public init(data: String) throws
    {
        try self = JSONParser.parser.run(sourceName: "", input: data)
    }
    
    public var string: String?
    {
        guard case ._String(let str) = self else { return nil }
        
        return str
    }
    
    public var double: Double?
    {
        guard case ._Number(let dbl) = self else { return nil }
        
        return dbl
    }
    
    public var bool: Bool?
    {
        guard case ._Bool(let b) = self else { return nil }
        
        return b
    }
    
    public var isNull: Bool
    {
        if case ._Null = self { return true }
        
        return false
    }
    
    public subscript(name: String) -> JSONParser
    {
        get
        {
            guard
                case ._Object(let dict) = self,
                let value = dict[name]
            else
            {
                return .Error
            }
            
            return value
        }
        
        set
        {
            guard
                case ._Object(var dict) = self
            else
            {
                return
            }
            
            dict[name] = newValue
        }
    }
    
    public subscript(index: Int) -> JSONParser
    {
        get
        {
            guard
                case ._Array(let arr) = self,
                index >= 0 && index < arr.count
            else
            {
                return .Error
            }
            
            return arr[index]
        }
        
        set
        {
            guard
                case ._Array(var arr) = self,
                index >= 0 && index < arr.count
            else
            {
                return
            }
            
            arr[index] = newValue
        }
    }
}
