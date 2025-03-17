//
//  ShippingDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

struct ShippingDetailView: View {
    
    var freeShipping: Bool
    var localShipping: Bool
    var storeShipping: Bool
  
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            if freeShipping {
                Text("Llega gratis")
                    .foregroundStyle(Colors.backgroundGreenColor)
                    .fontWeight(.semibold)
            }
            
            if localShipping {
                HStack(spacing: 3) {
                    Text("Retira gratis")
                        .foregroundStyle(Colors.backgroundGreenColor)
                        .fontWeight(.semibold)
                    Text("en una agencia de Mercado Libre.")
                }
            }
            
            if storeShipping {
                HStack(spacing: 3) {
                    Text("Retira gratis")
                        .foregroundStyle(Colors.backgroundGreenColor)
                        .fontWeight(.semibold)
                    Text("en tienda.")
                }
            } 
        }
    }
}

#Preview {
    ShippingDetailView(
        freeShipping: true,
        localShipping: true,
        storeShipping: true
    )
}
