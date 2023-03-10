//
//  RMService.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 25/12/2022.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///     - request: Request instance
    ///     - type: The type of object we expect to get back
    ///     - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> ()) {
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
            }
            print(request.url?.absoluteString ?? "")
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    
    // MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
