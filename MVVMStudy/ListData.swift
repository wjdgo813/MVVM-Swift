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
    var model : String?
    var make : String?
    var horsePower:Int?
    var photoURL : String?
    
    init(rawJson: Any) {
        if let json = rawJson as? JSON{
            model = json["model"].stringValue
            make = json["make"].stringValue
            horsePower = json["horsePower"].intValue
            photoURL = json["photoURL"].stringValue
        }
    }
    
    init(model : String,make:String,horsePower : Int, photoURL : String?) {
        self.model = model;
        self.make = make;
        self.horsePower = horsePower;
        self.photoURL = photoURL;
    }
}


struct RequestParameter {
    var model : String?
    var make : String?
    var horsePower:Int?
    var photoURL : String?
    
    init(model : String,make:String,horsePower : Int, photoURL : String?) {
        self.model = model;
        self.make = make;
        self.horsePower = horsePower;
        self.photoURL = photoURL;
    }
    
    init() {
        
    }
}
