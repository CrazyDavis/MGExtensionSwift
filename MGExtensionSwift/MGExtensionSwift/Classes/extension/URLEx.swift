//
//  URLEx.swift
//  MGExtensionSwift
//
//  Created by Magical Water on 2018/9/10.
//  Copyright © 2018年 Magical Water. All rights reserved.
//

import Foundation

public extension URL {
    public var queryDictionary: [String: String]? {
        guard let query = URLComponents(string: self.absoluteString)?.query else { return nil }
        
        var queryStrings = [String: String]()
        for pair in query.components(separatedBy: "&") {
            
            let key = pair.components(separatedBy: "=")[0]
            
            let value = pair
                .components(separatedBy:"=")[1]
                .replacingOccurrences(of: "+", with: " ")
                .removingPercentEncoding ?? ""
            
            queryStrings[key] = value
        }
        return queryStrings
    }
}
