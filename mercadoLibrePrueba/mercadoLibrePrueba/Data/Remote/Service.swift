//
//  Service.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import Foundation
import OSLog

protocol ServiceProtocol {
    func fetchData<T:Codable>(from url: String) async throws -> T
}

class Service: ServiceProtocol {
    func fetchData<T:Codable>(from url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw ServiceError.badURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            Logger().info("Error: \(error)")
            throw ServiceError.default
        }
    }
}
