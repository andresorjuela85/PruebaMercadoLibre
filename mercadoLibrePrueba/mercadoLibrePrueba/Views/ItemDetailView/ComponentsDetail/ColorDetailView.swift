//
//  ColorDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

/// Mostrará la información del color del producto en la vista de detalle.
struct ColorDetailView: View {
    
    var attributes: [Attribute]
    
    var body: some View {
        HStack {
            ForEach(0..<attributes.count, id: \.self) { index in
                if (attributes[index].id) == "COLOR" {
                    Text("Color:")
                    
                    if let color = attributes[index].valueName {
                        Text(color)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    ColorDetailView(attributes: [])
}
