//
//  LoadMoreAPI.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 22..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum LoadMoreAPIError : Error{
    case notExistNextPage
}

class LoadMoreAPI : MyAPI{
    private var currentPage : Int = 0
    
    @discardableResult
    func load<T:ListProtocol>(router : APIRouter,success:( (T)->Void )?,failure: ((Error)->Void)? )->DataRequest{
        return items(router: router, success: { [weak self] (list:T) in
            self?.currentPage = 1
            success?(list)
        }, failure: failure)
    }
    
    @discardableResult
    func items<T:ListProtocol>(router: APIRouter,success:( (T)->Void )?,failure:( (Error)->Void)? )->DataRequest{
        if let urlRequest = try? router.asURLRequest(),
            let httpMethod = urlRequest.httpMethod,
            let urlString = urlRequest.url?.absoluteString{
                print("[\(httpMethod)][Request] \(urlString)")
        }
        
        return Alamofire.request(router).validate().responseJSON{ response in
            switch response.result{
            case .success:
                guard let data = response.result.value else{return}
                switch router{
                case .list_image :
                    let list : T = T (rawJson:data)
                    success?(list)
                }
                
            case .failure(let error):
                failure?(error)
            }
        }
        
    }
    
}
