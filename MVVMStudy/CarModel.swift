//
//  Car.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 5. 25..
//  Copyright © 2017년 JHH. All rights reserved.
//

import UIKit

class CarModel: NSObject {
    var datas : [ListData] = []
    override init(){
        
    }
    
    func load(parameter:NSDictionary){
        guard let modelString :String = parameter["model"] as? String else{return}
        guard let makeString : String = parameter["make"] as? String else{return}
        guard let horsePowerInt:Int = parameter["horsePower"] as? Int else{return}
        guard let photoURLString:String = parameter["photoURL"] as? String else{return}
        
        let data = ListData(model: modelString, make: makeString, horsePower: horsePowerInt, photoURL: photoURLString)
        self.datas.append(data)
        
        NotificationCenter.default.post(name: Notification.Name.Model.changedLists, object : nil)
        
    }
}
