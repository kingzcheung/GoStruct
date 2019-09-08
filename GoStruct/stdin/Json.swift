//
//  Json.swift
//  GoStruct
//
//  Created by kingcheung on 1/9/2019.
//  Copyright © 2019 kingcheung. All rights reserved.
//

import Foundation

public struct Json {
    
    private static var indent = "    "

    /// JSON to object
    static func object(with text:String) -> Any? {
        guard let data = text.data(using: .utf8) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: [])
    }
    
    static func convert(_ json:Any?,to model:String,isArray:Bool = false) -> String {
        
        guard  let dict = json as? [String:Any] else {
            return "Please format your input as JSON."
        }
        
        var result = "\(model) struct { \n"
        if isArray {
            result = "\(model) []struct { \n"
        }
        
        dict.forEach { (key,value) in
            print(key)
            //print(value)
            
            let variable = camelCase(key: key)
            let tag = "`json:\"\(key)\"`\n"
            var count = 1
            let tabIndent = String(repeating: indent, count: count * 2)
            switch value {
            case is NSNull:
                result += "\(tabIndent)\(variable) interface{} \(tag)"
            case is Bool:
                result += "\(tabIndent)\(variable) bool \(tag)"
            case is String:
                result += "\(tabIndent)\(variable) string \(tag)"
            case is Int:
                result += "\(tabIndent)\(variable) int64 \(tag)"
            case is Float:
                result += "\(tabIndent)\(variable) float64 \(tag)"
            case let number as NSNumber:
                //print(number.intValue,number)
                //print(number.isEqual(to: number.int64Value))
               // print(number.objCType)
                if (number.isEqual(to: number.int64Value)) {
                    result += "\(tabIndent)\(variable) int64 \(tag)"
                }else if (number.isEqual(to: number.doubleValue)) {
                    result += "\(tabIndent)\(variable) float64 \(tag)"
                } else if (number.isEqual(to: number.boolValue)) {
                    result += "\(tabIndent)\(variable) bool \(tag)"
                }
                
            case let dict as [String:Any]:
                //                let model = variable
                count += 1
                result += "\(tabIndent) \(convert(dict, to: variable))  \(tag)"
                
            case let array as [Any]:
                if let first = array.first {
                    
                    if variable == "Data" {
                        print(type(of: first))
                        print(key)
                    }
                    
                    switch first {
                    case is NSNull:
                        result += "\(tabIndent)\(variable) []interface{} \(tag)"
                    case is Bool:
                        result += "\(tabIndent)\(variable) []bool \(tag)"
                    case is String:
                        result += "\(tabIndent)\(variable) []string \(tag)"
                    case let number as NSNumber:
                        if (number.isEqual(to: number.int64Value)) {
                            result += "\(tabIndent)\(variable) int64 \(tag)"
                        }else if (number.isEqual(to: number.doubleValue)) {
                            result += "\(tabIndent)\(variable) float64 \(tag)"
                        } else if (number.isEqual(to: number.boolValue)) {
                            result += "\(tabIndent)\(variable) bool \(tag)"
                        }
                    case let dict as [String:Any]:
                        count += 1
                        result += "\(tabIndent) \(convert(dict, to: variable,isArray: true))  \(tag)"
                    default:
                        break
                    }
                }
                
            default:
                break
                
            }
            
        }
        
        
        
        result += "}"
        return result
    }

    /// 下划线转驼峰法
    static func camelCase(key:String) -> String {
        var name = ""
        if key.contains("_") {
            let words = key.components(separatedBy: "_")
            //print(words)
            words.forEach { name += $0.capitalized }
            return name
        }
        return key.capitalized
    }
}

