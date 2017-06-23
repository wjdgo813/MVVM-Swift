//
//  ListData.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 13..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ListData : ListProtocol {
    var pubData : String?
    var title:String?
    var thumbnail:URL?
    var link:URL?
    var cpname:String?
    
    var height:Int?
    var width:Int?
    
    init(rawJson: Any) {
        if let json = rawJson as? JSON{
            self.pubData = json["pubData"].stringValue
            self.title = json["title"].stringValue
            self.thumbnail = json["thumbnail"].url
            self.link = json["link"].url
            self.cpname = json["cpname"].stringValue
            
            self.height = json["height"].intValue
            self.width = json["width"].intValue
        }
    }
}





/*
 let parameters:Parameters = ["q":"daum",
 "result":5,
 "pageno":1,
 "output":"json"
 ]
 */
struct RequestParameter {
    var q:String?
    var result:Int?
    var pageNo : Int?
    var output:String?
    init(q : String,result:Int,pageNo : Int, output : String?) {

        self.q = q
        self.result = result
        self.pageNo = pageNo
        self.output = output
    }
    
    init() {
        
    }
}
