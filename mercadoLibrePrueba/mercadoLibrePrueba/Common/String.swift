//
//  String.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import Foundation

extension String {

    /// Método para reemplazar una URL no segura haciendo el cambio del encabezado en el String recibido.
    func httpToHttps() -> String {
        self.replacingOccurrences(of: "http://", with: "https://")
    }
}
