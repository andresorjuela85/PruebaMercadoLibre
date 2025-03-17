//
//  SearchResult.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import Foundation

struct SearchResult: Codable {
    let paging: Paging
    let items: [SearchItem]

    enum CodingKeys: String, CodingKey {
        case paging
        case items = "results"
    }
}

// MARK: - Paging
struct Paging: Codable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset
        case limit
    }
}

// MARK: - SearchItem
struct SearchItem: Codable, Hashable, Equatable {
    let id: String
    let title: String
    let condition: String?
    let thumbnail: String
    let price: Double?
    let originalPrice: Double?
    let availableQuantity: Int?
    let acceptsMercadopago: Bool?
    let shipping: Shipping
    let attributes: [ItemAttribute]
    let installments: Installments?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case condition
        case thumbnail
        case price
        case originalPrice = "original_price"
        case availableQuantity = "available_quantity"
        case acceptsMercadopago = "accepts_mercadopago"
        case shipping
        case attributes
        case installments
    }
}

// MARK: - Shipping
struct Shipping: Codable, Hashable, Equatable {
    let freeShipping: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
    }
}

// MARK: - ItemAttribute
struct ItemAttribute: Codable, Hashable, Equatable {
    let id: String
    let name: String?
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}

// MARK: - Installments
struct Installments: Codable, Hashable, Equatable {
    let quantity: Int
    let amount: Double
    let rate: Int

    enum CodingKeys: String, CodingKey {
        case quantity
        case amount
        case rate
    }
}
