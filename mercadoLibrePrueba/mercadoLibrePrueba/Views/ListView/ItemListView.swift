//
//  ProductListView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 13/03/25.
//

import SwiftUI

/// Vista individual del Item mostrado en la lista de busqueda.
struct ItemListView: View {
    
    @State var item: SearchItem
    
    var body: some View {
        HStack(alignment: .top) {
            
            picture
            
            VStack(alignment: .leading, spacing: 10) {
                Text(item.attributes.first(where: { $0.id == "BRAND" })?.valueName ?? "")
                    .font(.footnote)
                    .fontWeight(.bold)
                
                Text(item.title)
                    .font(.footnote)
                
                PriceListView(originalPrice: item.originalPrice, price: item.price, installments: item.installments, freeShipping: item.shipping.freeShipping)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
    }
    
    private var picture: some View {
        VStack {
            AsyncImage(url: URL(string: item.thumbnail.httpToHttps())) {
                image in
                image.image?.resizable()
            }
            .scaledToFit()
            .cornerRadius(10)
        }
        .frame(width: 150)
    }
}

#Preview {
    ItemListView(
        item: SearchItem(
            id: "MCO1551973661",
            title: "",
            condition: "",
            thumbnail: "",
            price: 0,
            originalPrice: 0,
            availableQuantity: 0,
            acceptsMercadopago: false,
            shipping: Shipping(
                freeShipping: true
            ),
            attributes: [],
            installments: Installments(
                quantity: 0,
                amount: 0,
                rate: 0
            )
        )
    )
}
