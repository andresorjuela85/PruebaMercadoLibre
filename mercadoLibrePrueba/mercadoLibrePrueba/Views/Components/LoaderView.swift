//
//  LoaderView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

/// Vista que se muestra mientras se hace el llamado de los servicios.
struct LoaderView: View {
    var body: some View {
        
        ProgressView {
            Text("Buscando tus productos favoritos...")
                .font(.system(size: 16))
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoaderView()
}
