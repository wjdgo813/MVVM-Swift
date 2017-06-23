//
//  CarViewModel.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 12..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

extension ListData:Item{
    
}


class CarListViewModel:ItemsViewModel{
    let model:CarModel
    var requestParameter: RequestParameter? //api통신 할 때는 파라미터가 될 것이다. 지금은 통신을 안하므로 그냥 .. 데이터만... 넣는 척...
    init() {
        self.model = CarModel()
        NotificationCenter.default.addObserver(self, selector: #selector(onChangedIssues), name: Notification.Name.Model.changedLists, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    var numberOfItems: Int {
        return self.model.datas.count
    }
    
    func itemCellType(atIndex index: Int) -> ItemCellType {
        return .item
    }
    
    func itemCellViewModel(atIndex index: Int) -> ItemCellViewModel? {
        let data = self.item(atIndex: index) as! ListData
        return CarCellViewModel(data:data)
    }
    
    func item(atIndex index: Int) -> Item {
        return self.model.datas[index]
    }
    
    func setParameter(_ data: Any) {
        self.requestParameter = data as? RequestParameter ?? nil
    }
    
    func loadData() {
        let parameters:Parameters = ["q":"daum",
                                       "result":5,
                                       "pageno":1,
                                       "output":"json"
                                                    ]
        
        self.model.load(parameter: parameters)
    }
    
    
    
    
    
    @objc func onChangedIssues() {
        NotificationCenter.default.post(name: Notification.Name.ViewModel.changedLists, object: nil)
    }
    
}
