//
//  Date.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 17/03/25.
//

import Foundation

class Date {
    /// Función para convertir el formato de  la fecha recibida en el campo de las preguntas.
    func stringToDate(string: String) -> String? {
        if string != "" {
            let stringDate = string.components(separatedBy: ".")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

            let date = dateFormatter.date(from: stringDate[0])
            let convertDate = DateFormatter()
            convertDate.dateFormat = "dd/MM/yyyy"
            if let date = date {
                let dateFormatted  = convertDate.string(from: date)
                return dateFormatted
            }
        }
        return ""
    }
}
