//
//  ItemResult.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import Foundation

// MARK: - Welcome
struct ItemResult: Codable {
    let id: String
    let title: String
    let price: Double?
    let basePrice: Double?
    let originalPrice: Double?
    let initialQuantity: Int?
    let condition: String?
    let thumbnail: String?
    let pictures: [Picture]
    let acceptsMercadopago: Bool?
    let shipping: ShippingItem?
    let attributes: [Attribute]
    let status: String?
    let warranty: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case basePrice = "base_price"
        case originalPrice = "original_price"
        case initialQuantity = "initial_quantity"
        case condition
        case thumbnail
        case pictures
        case acceptsMercadopago = "accepts_mercadopago"
        case shipping
        case attributes
        case status
        case warranty
    }
}

// MARK: - Attribute
struct Attribute: Codable {
    let id: String
    let name: String?
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String?
    let secureURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case secureURL = "secure_url"
    }
}

// MARK: - Shipping
struct ShippingItem: Codable {
    let mode: String
    let localPickUp: Bool?
    let freeShipping: Bool?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case mode
        case localPickUp = "local_pick_up"
        case freeShipping = "free_shipping"
        case storePickUp = "store_pick_up"
    }
}
