//
//  HeaderDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

struct HeaderDetailView: View {
    
    var new: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if new == "new" {
                Text("Nuevo")
                    .font(.caption)
                    .foregroundStyle(Color.gray)
            }
            
            Text(title)
        }
        .padding(.top, 15)
    }
}

#Preview {
    HeaderDetailView(new: "Nuevo", title: "Producto")
}
