//
//  APIRouter.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 16..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : URLRequestConvertible{
    case list_image(params:Parameters?)
    
    static let baseURLString = "https://apis.daum.net"
    static let apiKey = "d9c57e78e3c7c9b6bbd00d8ca3c788fa"
    
    var method : HTTPMethod{
        switch self {
        case .list_image:
            return .post
        }
    }
    
    fileprivate var result : (path : String, parameters : Parameters?){
        switch self {
            
        case .list_image(let param):
            let originalURL = "/search/image?apikey=\(APIRouter.apiKey)"
            let escapedString = originalURL.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
            
            let escaped = CFURLCreateStringByAddingPercentEscapes(nil, originalURL as CFString, nil,
                                                                  "/%&=?$#+-~@<>|\\*,.()[]{}^!" as CFString,
                                                                  CFStringBuiltInEncodings.UTF8.rawValue)
            
            return (escaped!,param)
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .list_image:
            let url = try APIRouter.baseURLString.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
            urlRequest.httpMethod = method.rawValue
            
            
            return try URLEncoding.default.encode(urlRequest, with: result.parameters)
        }
    }
}
