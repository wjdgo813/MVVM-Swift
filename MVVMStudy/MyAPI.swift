//
//  MyAPI.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 22..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum APIError:Error{
    case invalidJson
}

class MyAPI{
    @discardableResult
    func request<T:ListProtocol>(router:APIRouter,sucess:((T)->Void)?,failure: ((Error)->Void)? ) -> DataRequest{
        return loadRequest(router: router, success: { (list:T) in
            sucess?(list)
        }, failure: failure)
    }
    
    
    private func loadRequest<T:ListProtocol>(router: APIRouter,
                             success:( (T)->Void )?,
                             failure: ( (Error)->Void)?)->DataRequest{
        if let urlRequest = try? router.asURLRequest(),
            let httpMethod = urlRequest.httpMethod,
            let urlString = urlRequest.url?.absoluteString{
            print("[\(httpMethod)][Request] \(urlString)")
        }
        
        
        return Alamofire.request(router).validate().responseData{ response in
            switch response.result{
            case .success:
                guard let data = response.result.value else{ return }
                
                switch router{
                    case .list_image :
                        guard let stringData = String(data:data,encoding: .utf8) else{return}
                        let replacedStringData = stringData.replacingOccurrences(of: "\\", with: "'")
                        guard let replaceStringData = replacedStringData.data(using: .utf8)else{return}
                        let list : T = T (rawJson: replaceStringData)
                        success?(list)
                }
            case .failure(let error):
                failure?(error)
            }
        }
    }
}
