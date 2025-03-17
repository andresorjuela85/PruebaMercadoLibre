//
//  RetryView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

/// Vista que se implementa si no se recibe data al mostrar la vista.
struct RetryView: View {
    
    var action: (() -> Void)
    
    var body: some View {
        VStack {
            Text("Algo sucedió, por favor inténtalo de nuevo.")
                .font(.system(size: 16))
                .foregroundStyle(.secondary)
                .padding()
        }
    }
}

#Preview {
    RetryView {}
}
