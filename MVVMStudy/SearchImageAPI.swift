//
//  SearchImageAPI.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 22..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation
import Alamofire

class SearchImageAPI:LoadMoreAPI{
    @discardableResult
    func loadImageList(_ parameter:Parameters,success:((ListResult)->Void)?,failure:((Error)->Void)?)->DataRequest {
        let router:APIRouter = .list_image(params:parameter)
        return load(router:router,success:success,failure:failure)
    }
    
}


