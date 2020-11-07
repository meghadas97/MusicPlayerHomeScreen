//
//  NetworkingCall.swift
//  BookStoreExample
//
//  Created by Monali Das on 07/11/20.
//  Copyright © 2020 Monali Das. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case dataNotFound
}

class NetworkingCall {
    
    static let shared = NetworkingCall()
    var searchTask : URLSessionDataTask!
    
    func getHomePageSearchData(url : String, completionHandler: @escaping (Result<BooksModel, NetworkError>) -> Void){
        
        if self.searchTask != nil{
            if self.searchTask.state == URLSessionTask.State.running
            {
                URLSession.shared.invalidateAndCancel()
                self.searchTask.cancel()
            }
        }
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        //request.setValue("", forHTTPHeaderField: "q")
        
        let task = session.dataTask(with: request , completionHandler: {data, response, error -> Void in
            
            guard let data = data else {
               completionHandler(.failure(.dataNotFound))
               return
            }
            do{
                let BookJson = try JSONDecoder().decode(BooksModel.self, from: data)
                completionHandler(.success(BookJson))
            }catch let error{
                print(error.localizedDescription)
            }
            
        })
        task.resume()
        
        
    }
}
