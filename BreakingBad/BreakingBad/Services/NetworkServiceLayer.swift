//
//  NetworkServiceLayer.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//


import Foundation

class ServiceLayer {
    // 1.
    class func request<T: Codable>(router: NetworkRouter, completion: @escaping (Result<T, Error>) -> ()) {
        
        // 2.
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        
        // Config
        let sessionConfig = URLSessionConfiguration.default
        //let key = ""
        //let authValue: String = "Bearer " + key
        //sessionConfig.httpAdditionalHeaders = ["Authorization": authValue]
        
        // 3.
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = router.method
        
        // 4.
        let session = URLSession(configuration: sessionConfig)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            // 5.
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard response != nil else {
                return
            }
            guard let data = data else {
                return
            }
            
            // 6.
            do{
                
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                
                // 7.
                DispatchQueue.main.async {
                    // 8.
                    completion(.success(responseObject))
                }
                
            }catch {
                completion(.failure(error))
            }
            
        }
        dataTask.resume()
    }
}
