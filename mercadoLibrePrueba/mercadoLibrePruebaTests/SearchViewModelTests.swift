//
//  mercadoLibrePruebaTests.swift
//  mercadoLibrePruebaTests
//
//  Created by Andres Camilo Orjuela Hurtado on 13/03/25.
//

import XCTest
import Observation
@testable import mercadoLibrePrueba

final class SearchViewModelTests: XCTestCase {
    
    func test_search_Success() async throws {
        
        let mockService = MockService()
        let useCase = SearchUseCase(service: mockService)
        let viewModel = SearchViewModel(useCase: useCase)
        let expectation = XCTestExpectation(description: "Get search success")
        
        withObservationTracking {
            _ = viewModel.searchResult?.items
        } onChange: {
            expectation.fulfill()
        }
        
        viewModel.getResults(for: "iPhone")
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertEqual(viewModel.searchResult?.items.count, 49)
    }
}
