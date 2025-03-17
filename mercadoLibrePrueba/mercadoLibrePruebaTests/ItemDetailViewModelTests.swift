//
//  ItemDetailTests.swift
//  mercadoLibrePruebaTests
//
//  Created by Andres Camilo Orjuela Hurtado on 17/03/25.
//

import XCTest
import Observation
@testable import mercadoLibrePrueba

final class ItemDetailViewModelTests: XCTestCase {

    let item = SearchItem(id: "", title: "", condition: "", thumbnail: "", price: 0, originalPrice: 0, availableQuantity: 0, acceptsMercadopago: false, shipping: Shipping(freeShipping: false), attributes: [], installments: Installments(quantity: 0, amount: 0, rate: 0))
        
    func test_getItem_Success() async throws {
        
        let mockService = MockService()
        let useCase = SearchUseCase(service: mockService)
        let viewModel = ItemDetailViewModel(item: item, useCase: useCase)
        let expectation = XCTestExpectation(description: "Get item success")
        
        withObservationTracking {
            _ = viewModel.detailItem
        } onChange: {
            expectation.fulfill()
        }
        
        viewModel.getItem()
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertEqual(viewModel.detailItem?.id, "MCO2684430368")
    }
    
    func test_getDescription_Success() async throws {
        
        let mockService = MockService()
        let useCase = SearchUseCase(service: mockService)
        let viewModel = ItemDetailViewModel(item: item, useCase: useCase)
        let expectation = XCTestExpectation(description: "Get description item success")
        
        withObservationTracking {
            _ = viewModel.descriptionItem
        } onChange: {
            expectation.fulfill()
        }
        
        viewModel.getDescription()
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertEqual(viewModel.descriptionItem?.text, "descriptionResult")
    }
    
    func test_getQuestions_Success() async throws {
        
        let mockService = MockService()
        let useCase = SearchUseCase(service: mockService)
        let viewModel = ItemDetailViewModel(item: item, useCase: useCase)
        let expectation = XCTestExpectation(description: "Get questions of item success")
        
        withObservationTracking {
            _ = viewModel.questionsItem
        } onChange: {
            expectation.fulfill()
        }
        
        viewModel.getQuestions()
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertEqual(viewModel.questionsItem?.total, 12)
    }
}
