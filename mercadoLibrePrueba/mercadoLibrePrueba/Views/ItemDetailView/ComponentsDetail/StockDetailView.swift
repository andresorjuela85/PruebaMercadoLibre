//
//  StockDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

struct StockDetailView: View {
    
    var quantity: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Stock disponible")
                .font(.title3)
                .fontWeight(.semibold)
            
            Button {
                //
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255))
                        .cornerRadius(8)
                    
                    HStack {
                        Text("Cantidad:")
                        Text("1")
                            .fontWeight(.bold)
                        Text(quantity == 1 ? " (\(quantity) disponible)" : " (+\(quantity) disponibles)")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.blue)
                    }
                    .padding(.horizontal, 12)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(spacing: 8) {
                ButtonView(title: "Comprar ahora", backgroundColor: Colors.backgroundBlueColor, textColor: .white)
                ButtonView(title: "Agregar al carrito", backgroundColor: Colors.backgroundBlueColor, textColor: .white)
            }
        }
    }
}

#Preview {
    StockDetailView(quantity: 10)
}
