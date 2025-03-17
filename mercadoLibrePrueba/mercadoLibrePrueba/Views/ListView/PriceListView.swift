//
//  PriceListView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

struct PriceListView: View {
    
    var originalPrice: Double?
    var price: Double?
    var installments: Installments?
    var freeShipping: Bool?
      
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
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                    if let originalPrice = originalPrice, originalPrice != 0 {
                        let discount = Int(((originalPrice - fullPrice) / originalPrice) * 100)
                        
                        Text("\(discount.formatted())% OFF")
                            .font(.footnote)
                            .foregroundStyle(Colors.backgroundGreenColor)
                    }
                }
            }
            
            if let installments = installments {
                Text("en \(installments.quantity) cuotas de $\(installments.amount.formatted()) con \(installments.rate)% de interés")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.footnote)
                    .foregroundStyle(Colors.backgroundGreenColor)
            }
            
            if let freeShipping = freeShipping, freeShipping {
                Text("Envío gratis")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(Colors.backgroundGreenColor)
                    .cornerRadius(5)
            }  
        }
    }
}

#Preview {
    PriceListView(price: 0)
}
