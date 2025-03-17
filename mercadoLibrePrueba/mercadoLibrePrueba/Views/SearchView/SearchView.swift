//
//  ContentView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 13/03/25.
//

import SwiftUI

/// Vista inicial de la aplicación, se debe hacer poner un valor valido en el campo de busqueda, solamente hará el llamado al dar buscar o la lupa en el dispositivo, en el simulador funciona también con enter.
struct SearchView: View {
    
    @State var viewModel = SearchViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                searchBar
                
                if viewModel.isLoading {
                    LoaderView()
                } else {
                    if viewModel.items.isEmpty {
                        emptySearchPlaceholder
                    } else {
                        ItemsListView(items: viewModel.items)
                    }
                }
            }
            .navigationTitle("Mercado Libre")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Colors.backgroundYellowColor, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        .buttonStyle(PlainButtonStyle())
        .tint(.black)
    }
    
    private var searchBar: some View {
        HStack {
            TextField("Buscar en Mercado Libre", text: $searchText, onCommit: {
                viewModel.getResults(for: searchText)
            })
            .textFieldStyle(.roundedBorder)
            .padding(.vertical, 12)
            .padding(.leading, 12)
            .submitLabel(.search)
            
            Button {
                viewModel.getResults(for: searchText)
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.trailing, 12)
        .background(Colors.backgroundYellowColor)
    }
    
    private var emptySearchPlaceholder: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundColor(.secondary)
            
            Text("Por favor ingresa un término de búsqueda.")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SearchView()
}
