//
//  QuestionResult.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import Foundation

struct QuestionResult: Codable {
    let total: Int
    let questions: [Question]?

    enum CodingKeys: String, CodingKey {
        case total
        case questions
    }
}

// MARK: - Question
struct Question: Codable {
    let dateCreated: String?
    let status: String?
    let text: String?
    let id: Int
    let answer: Answer?

    enum CodingKeys: String, CodingKey {
        case dateCreated = "date_created"
        case status
        case text
        case id
        case answer
    }
}

// MARK: - Answer
struct Answer: Codable {
    let text: String
    let status: String?
    let dateCreated: String?

    enum CodingKeys: String, CodingKey {
        case text
        case status
        case dateCreated = "date_created"
    }
}
