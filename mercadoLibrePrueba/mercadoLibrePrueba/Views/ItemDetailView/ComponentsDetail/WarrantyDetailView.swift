//
//  WarrantyDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

struct WarrantyDetailView: View {
    
    var warranty: String
    
    var body: some View {
        HStack {
            Image(systemName: "shield.lefthalf.filled")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(warranty)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WarrantyDetailView(warranty: "12 meses")
}
