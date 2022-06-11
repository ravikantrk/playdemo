//
//  NetworkManger.swift
//  PlayoDemo
//
//  Created by Ravi kant Tiwari on 11/06/22.
//

import UIKit
import Alamofire
//MARK: common api function class
class NetworkManger: NSObject {
    let BaseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey="
    
    func getApiCall(apiurl : String, completion:@escaping (NetworkResponseState) -> Void)
    {
        let url = BaseUrl + apiurl
        let header : HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
        
        AF.request(url, method: .get, headers:header).responseJSON { response in
            switch (response.result) {
                
            case .success( _):
                let resultData : [String:Any] = response.value as? [String : Any] ?? [:]
                completion(.success(resultData))
                
                break
            case .failure(let error):
                completion(.failed(error.localizedDescription))
                break
            }
            
        }
    }
}

enum NetworkResponseState {
    case success([String:Any])
    case failed(Any)
}
