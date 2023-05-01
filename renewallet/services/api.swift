//
//  api.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/30/23.
//

import Foundation
//
//  api.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/29/23.
//

import Foundation
class Api{
    func postCodableModel<T: Encodable, U: Decodable>(model: T, apiUrlString: String, resultType: U.Type, completion: @escaping (Result<U, Error>) -> Void) {
        guard let url = URL(string: apiUrlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(model)
            request.httpBody = jsonData
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                    if let data = data {
                        do {
                            let jsonDecoder = JSONDecoder()
                            let decodedData = try jsonDecoder.decode(resultType, from: data)
                            completion(.success(decodedData))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                } else {
                    let error = NSError(domain: "Invalid response from server", code: 0, userInfo: nil)
                    completion(.failure(error))
                }
            }
            
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }

}
