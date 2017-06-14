//
//  ItemsViewModel.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 13..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation

protocol ItemsViewModel {
    
    
    var numberOfItems:Int {get}
    func itemCellType(atIndex index:Int) -> ItemCellType
    func itemCellViewModel(atIndex index:Int) -> ItemCellViewModel?
    func item(atIndex index:Int) -> Item
    
    
    
    func setParameter(_ data:Any)
    func loadData()
    
}
