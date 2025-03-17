//
//  ServiceConstants.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import Foundation

enum ServiceError: Error {
    case `default`
    case badURL
}

enum Endpoints: String {
    case search = "https://worker-challenge-meli.jsagredo-ing-meli.workers.dev/sites/MCO/search?q=%@&limit=50&offset=0"
    case items = "https://worker-challenge-meli.jsagredo-ing-meli.workers.dev/items/%@"
    case itemDescription = "https://api.mercadolibre.com/items/%@/description"
    case questionsItem = "https://api.mercadolibre.com/questions/search?item=%@"
}
