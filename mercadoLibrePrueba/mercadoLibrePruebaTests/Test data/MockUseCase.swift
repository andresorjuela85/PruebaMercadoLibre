//
//  MockUseCase.swift
//  mercadoLibrePruebaTests
//
//  Created by Andres Camilo Orjuela Hurtado on 16/03/25.
//

import Foundation
import OSLog
@testable import mercadoLibrePrueba

class MockService: ServiceProtocol {
    
    func fetchData<T:Codable>(from url: String) async throws -> T {
        
        var fileName: String = ""
        
        if T.self == SearchResult.self {
            fileName = "Search"
        }
     
        if T.self == ItemResult.self {
            fileName = "Item"
        }
        
        if T.self == DescriptionItem.self {
            fileName = "Description"
        }
        
        if T.self == QuestionResult.self {
            fileName = "Questions"
        }

        guard let jsonData = readLocalJSONFile(forName: fileName) else {
            throw ServiceError.default
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
            return decodedData
        } catch {
            throw ServiceError.default
        }
    }
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            let testBundle = Bundle(for: type(of: self))
            
            if let fileURL = testBundle.url(forResource: name, withExtension: "json") {
                let data = try Data(contentsOf: fileURL)
                return data
            }
        } catch {
            Logger().info("Error al leer el archivo JSON: \(error)")
        }
        return nil
    }
}
