//
//  ItemDetailViewModel.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import Foundation
import OSLog

@Observable
class ItemDetailViewModel {
    
    private let useCase: SearchUseCaseProtocol
    
    var item: SearchItem
    var detailItem: ItemResult?
    var descriptionItem: DescriptionItem?
    var questionsItem: QuestionResult?
    var isLoading: Bool = false
    
    init(item: SearchItem, useCase: SearchUseCaseProtocol = SearchUseCase()) {
        self.useCase = useCase
        self.item = item
    }
    
    /// Llamado simultaneo de las tres funciones de Request a la API
    func getData() {
        getItem()
        getDescription()
        getQuestions()
    }
    
    func getItem() {
        Task { @MainActor in
            isLoading = true
            do {
                detailItem = try await useCase.getItem(id: item.id)
            } catch {
                Logger().info("Error al obtener el item: \(error)")
            }
            isLoading = false
        }
    }
    
    func getDescription() {
        
        Task { @MainActor in
            do {
                descriptionItem = try await useCase.getDescription(id: item.id)
            } catch {
                Logger().info("Error al obtener la descripción del item: \(error)")
            }
        }
    }
    
    func getQuestions() {
        Task { @MainActor in
            do {
                questionsItem = try await useCase.getQuestions(id: item.id)
            } catch {
                Logger().info("Error al obtener la descripción del item: \(error)")
            }
        }
    }
}
