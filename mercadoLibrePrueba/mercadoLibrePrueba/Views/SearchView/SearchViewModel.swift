//
//  ItemsListViewModel.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import Foundation

@Observable
class SearchViewModel {
    
    private let useCase: SearchUseCaseProtocol
    
    var searchResult: SearchResult?
    var items: [SearchItem] = []
    var isLoading: Bool = false
    
    init(useCase: SearchUseCaseProtocol = SearchUseCase()) {
        self.useCase = useCase
    }
    
    func getResults(for query: String) {
        Task { @MainActor in
            isLoading = true
            do {
                searchResult = try await useCase.search(query: query)
                items = searchResult?.items ?? []
            } catch {
                items = []
            }
            isLoading = false
        }
    }
}
