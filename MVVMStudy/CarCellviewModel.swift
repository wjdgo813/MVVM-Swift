//
//  CarCellviewModel.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 13..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation


class CarCellViewModel: ItemCellViewModel {
    private var data : ListData
    
    init(data : ListData){
        self.data = data
    }
    
    var model : String{
        return self.data.model!
    }
    
    var make : String{
        return self.data.make!
    }
    
    var horsePower : Int{
        return self.data.horsePower!
    }
    
    var photoURL : String{
        return self.data.photoURL!
    }
    
}
