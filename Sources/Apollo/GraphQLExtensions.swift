//
//  GraphQLExtensions.swift
//  Apollo
//
//  Created by Leery on 2020/2/12.
//

import Foundation

public enum GraphQLTipType: Int {
    case toast = 1
    case alert = 2
}

public class GraphQLExtensions: NSObject {
    public var type: GraphQLTipType = .toast
    public var message: String = ""
    
    convenience init(type: GraphQLTipType, message: String) {
        self.init()
        self.type = type
        self.message = message
    }
    
    override init() {
        super.init()
    }
     
    public class func dictionaryToExtensions(_ dic: JSONObject?) -> GraphQLExtensions? {
        guard let tip = dic?["tip"] as? JSONObject else {
           return nil
        }
        guard let type = tip["type"] as? Int else {
            return nil
        }
        guard let tipType = GraphQLTipType(rawValue: type) else {
            return nil
        }
        guard let message = tip["message"] as? String else {
            return nil
        }
        let ext = GraphQLExtensions(type: tipType, message: message)
        return ext
    }
}


