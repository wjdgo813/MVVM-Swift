//
//  ListSet.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 23..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ListResult:ListProtocol {
    
    let listSet : ListSet?
    init(rawJson:Any) {
        let json = JSON(rawJson)
        self.listSet = ListSet(rawJson:json["channel"].rawValue)
        
    }
}

struct ListSet:ListProtocol{
    let result:Int?
    let pageCount : Int?
    let totalCount : Int?
    let title : String?
    let item:Array<Any>?
    
    init(rawJson: Any) {
        let json = JSON(rawJson)
    
        self.result = json["result"].intValue
        self.pageCount = json["pageCount"].intValue
        self.totalCount = json["totalCount"].intValue
        self.title = json["title"].stringValue
        self.item = json["item"].arrayValue
    }
}

