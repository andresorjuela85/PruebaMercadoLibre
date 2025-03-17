//
//  ProductsListView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

/// Lista completa de los resultados de la busqueda hecha en la vista SearchView
struct ItemsListView: View {
    
    var items: [SearchItem] = []
    
    var body: some View {
        ScrollView {
            ForEach(items, id: \.self) { item in
                NavigationLink(destination: ItemDetailView(item: item)) {
                    ItemListView(item: item)
                }
                
                Divider()
            }
        }
        .scrollIndicators(.hidden)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

#Preview {
    ItemsListView()
}
