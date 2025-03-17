//
//  DescriptionView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

/// Mostrará la descripción del producto en la vista de detalle si el item cuenta con esta data, se implementa un botón permite expandir y colapsar la descripción completa.
struct DescriptionView: View {
    
    var description: String
    @State var isCollapsed = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Descripción")
                .font(.title3)
                .fontWeight(.semibold)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(description)
                    .frame(maxHeight: isCollapsed ? 150 : .infinity, alignment: .leading)
                
                Button {
                    self.isCollapsed = !self.isCollapsed
                } label: {
                    if self.isCollapsed {
                        HStack {
                            Text("Ver descripción completa")
                                .font(.footnote)
                                .foregroundColor(Color.blue)
                                .multilineTextAlignment(.leading)
                            Image(systemName: "chevron.down")
                                .font(.footnote)
                                .foregroundColor(Color.blue)
                        }
                    } else {
                        Text("Ver menos")
                            .font(.footnote)
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "chevron.up")
                            .font(.footnote)
                            .foregroundColor(Color.blue)
                    }
                }
            }
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    DescriptionView(description: "")
}
