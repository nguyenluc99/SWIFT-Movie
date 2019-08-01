////  ApiManager.swift
//  Movie
//
//  Created by Luc Nguyen on 8/1/19.
//  Copyright © 2019 Luc Nguyen. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias Completion = (_ success: Bool, _ data: [String: Any?]?) -> ()

class APIGenres {
    static let shared : APIGenres = APIGenres()
    
    func getData(url : String, completion : @escaping Completion) {
        if let url = URL(string : url) {
            var urlRequest = URLRequest(url : url)
            urlRequest.httpMethod = "GET"
            urlRequest.timeoutInterval = 10
            URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
                if let responseData = data {
                    let json = JSON(responseData)["genres"].arrayValue
                    var detailModel = [DetailModel] ()
                    for jsonData in json {
                        detailModel.append(DetailModel(json: jsonData))
                        
                    }
                    for model in detailModel {
                        AppSettings.genres[model.id] = model.name                    }
                    print(AppSettings.genres)
                    
                } else {
                    completion(false, nil)
                }
            }.resume()
        }
        
    }
    func getDiscover( url : String, completion : @escaping Completion) {
        if let url = URL(string : url){
            var urlRequest = URLRequest(url : url)
            urlRequest.httpMethod = "GET"
            urlRequest.timeoutInterval = 10
            URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
                if let responseData = data{
                    let json=JSON(responseData)["results"].arrayValue
                    print(json)
                }
            }.resume()
    
    }
    }
}
