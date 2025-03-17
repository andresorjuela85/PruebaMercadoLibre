//
//  Double.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import Foundation

extension Double {
    
    /// Función que permite cambiar los valores de enteros recibidos con dos ceros en el decimal y mostrar solamente la parte entera.
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        
        let number = NSNumber(value: self)
        let formattedValue = formatter.string(from: number) ?? ""
        return formattedValue
        
    }
}

