//
//  DescriptionItem.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import Foundation

struct DescriptionItem: Codable {
    let text: String
    let plainText: String?
    let lastUpdated: String?
    let dateCreated: String?

    enum CodingKeys: String, CodingKey {
        case text
        case plainText = "plain_text"
        case lastUpdated = "last_updated"
        case dateCreated = "date_created"
    }
}
