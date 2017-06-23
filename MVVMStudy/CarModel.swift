//
//  Car.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 5. 25..
//  Copyright © 2017년 JHH. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CarModel: NSObject {
    var datas : [ListData] = []
    var listData : ListResult?
    
    private let api :SearchImageAPI! = SearchImageAPI()
    private var apiRequest:DataRequest?
    
    
    override init(){
        
    }
    
    func load(parameter:Parameters){
        guard apiRequest == nil else {
            return
        }
        apiRequest = api.loadImageList(parameter, success: { [weak self](listSet) in
            self?.listData = listSet
            let rawDatas = self?.listData?.listSet?.item
            rawDatas?.forEach{ rawJson in
                self?.datas.append(ListData(rawJson:rawJson))
            }
            NotificationCenter.default.post(name: Notification.Name.Model.changedLists, object: nil)
            self?.apiRequest = nil
            
        }){ [weak self] (error) in self?.apiRequest = nil
            
        }
    }
}
