//
//  Configuration.swift
//  Moments
//
//  Created by chenying on 2022/12/14.
//

import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {  
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else { throw Error.missingKey}
        
        switch object {
        case let value as T:
            return value
        case let value as String:
            guard let result = T(value) else { fallthrough }
            return result
        default:
            throw Error.invalidValue
        }
    }
}
