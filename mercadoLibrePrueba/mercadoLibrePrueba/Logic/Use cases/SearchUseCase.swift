//
//  SearchUseCase.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import Foundation

protocol SearchUseCaseProtocol {
    func search(query: String) async throws -> SearchResult
    
    func getItem(id: String) async throws -> ItemResult
    
    func getDescription(id: String) async throws -> DescriptionItem
    
    func getQuestions(id: String) async throws -> QuestionResult
}

class SearchUseCase: SearchUseCaseProtocol {
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func search(query: String) async throws -> SearchResult {
        
        let endpoint = String(format: Endpoints.search.rawValue, query)
        
        let result: SearchResult = try await service.fetchData(from: endpoint)
        
        return result
    }
    
    func getItem(id: String) async throws -> ItemResult {
        
        let endpoint = String(format: Endpoints.items.rawValue, id)
        
        let result: ItemResult = try await service.fetchData(from: endpoint)
        
        return result
    }
    
    func getDescription(id: String) async throws -> DescriptionItem {
        
        let endpoint = String(format: Endpoints.itemDescription.rawValue, id)
        
        let result: DescriptionItem = try await service.fetchData(from: endpoint)
        
        return result
    }
    
    func getQuestions(id: String) async throws -> QuestionResult {
        
        let endpoint = String(format: Endpoints.questionsItem.rawValue, id)
        
        let result: QuestionResult = try await service.fetchData(from: endpoint)
        
        return result
    }
}
