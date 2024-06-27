//
//  APIService.swift
//  eczane
//
//  Created by hazem omer on 17.05.2024.
//

import Foundation

class APIService {
    static let apiKey = "k3cFxQ6aA6MRfRDGvi4bKyj4KF0FH76Kr1OjWDqQAIFM4qwXx0SNlq96FmzG"
    static let baseURL = "https://www.nosyapi.com/apiv2/service/pharmacies-on-duty?city=edirne"
    
    static func fetchPharmacies(for district: String, completion: @escaping (Result<[Pharmacy], Error>) -> Void) {
        var urlString = baseURL
        
        if district != "il" {
            urlString += "&district=\(district)"
        }
        
        urlString += "&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PharmacyResponse.self, from: data)
                if response.status == "success" {
                    completion(.success(response.data))
                } else {
                    let message = response.message
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message])))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
