//
//  NetworkingManager.swift
//  SpaceX
//
//  Created by david on 9/5/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

final class NetworkingManager {
    
    static let share = NetworkingManager()
    
    private init(){}
    
    func request<T:Codable>(_absoluteURL:String,parameter:Data,type:T.Type,completion:@escaping(_ result: Result<T,Error>)->Void) {
        
        guard let url = URL(string: _absoluteURL) else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }
        
    
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = parameter
        request.addValue("application/json;charest=utf-8", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data,response,error in
            
            if error != nil {
                completion(.failure(NetworkingError.custome(error: error!)))
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            guard let response = response as? HTTPURLResponse,
                (200...300) ~= response.statusCode else{
                    completion(.failure(NetworkingError.invalidStatusCode(statuseCode: statusCode)))
                    return
            }
            guard let data = data else{
                completion(.failure(NetworkingError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let res = try decoder.decode(T.self, from: data)
                completion(.success(res))
            }catch{
                completion(.failure(NetworkingError.faildToDecode(error: error)))
            }
            
            
        }
        dataTask.resume()
        
    }
    
    
}

extension NetworkingManager {
    enum NetworkingError:Error {
        case invalidUrl
        case custome(error:Error)
        case invalidStatusCode(statuseCode:Int)
        case invalidData
        case faildToDecode(error:Error)
    }
}
