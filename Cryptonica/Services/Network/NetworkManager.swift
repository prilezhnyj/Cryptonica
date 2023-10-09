//
//  NetworkManager.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import Foundation
import Combine

class NetworkManager {
    
    enum NetworkError: LocalizedError {
        case badServerResponse
        case unknown
        
        var errorDescription: String? {
            switch self {
                case .badServerResponse: return "[🔥] Bad response from URL"
                case .unknown: return "[🔥] Unknown error"
            }
        }
    }
    
    static func download(for url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(for: $0)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    static func handleURLResponse(for output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let responce = output.response as? HTTPURLResponse,
              responce.statusCode >= 200 && responce.statusCode < 300 else {
            throw NetworkError.badServerResponse
        }
        return output.data
    }
}
