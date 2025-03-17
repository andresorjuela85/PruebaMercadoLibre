//
//  PriceDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

struct PriceDetailView: View {
    
    var originalPrice: Double?
    var price: Double?
    var installments: Installments?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let originalPrice = originalPrice {
                Text("$ \(originalPrice.formatted())")
                    .foregroundStyle(.gray)
                    .strikethrough()
            }
            
            HStack {
                if let fullPrice = price {
                    Text("$ \(fullPrice.formatted())")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    if let originalPrice = originalPrice, originalPrice != 0 {
                        let discount = Int(((originalPrice - fullPrice)/originalPrice) * 100)
                        
                        Text("\(discount)% OFF")
                            .foregroundStyle(Colors.backgroundGreenColor)
                    }
                }
            }
            
            if let installments = installments {
                HStack(alignment: .top, spacing: 3) {
                    Text("en")
                    Text("\(installments.quantity) cuotas de $\(installments.amount.formatted()) con \(installments.rate)% de interés")
                        .foregroundStyle(Colors.backgroundGreenColor)
                }
            }  
        }
    }
}

#Preview {
    PriceDetailView(price: 0)
}
