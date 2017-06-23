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
    
    var pubData :String{
        return self.data.pubData!
    }
    
    var title:String{
        return self.data.title!
    }
    
    var thumbnail:URL{
        return self.data.thumbnail!
    }
    
    var link:URL{
        return self.data.link!
    }
    
    var cpname:String{
        return self.data.cpname!
    }
    
    var height : Int{
        return self.data.height!
    }
    
    var width:Int{
        return self.data.width!
    }
    
    
    
    
}
