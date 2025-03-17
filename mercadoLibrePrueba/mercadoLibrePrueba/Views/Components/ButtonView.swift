//
//  ButtonView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

/// Vista de los botones en el detalle del Item, se crea con elemento Button, pero en la prueba no tienen acciones asociadas.
struct ButtonView: View {
    
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Button {
            //
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(backgroundColor)
                    .cornerRadius(8)
                
                Text(title)
                    .foregroundStyle(textColor)
                    .fontWeight(.semibold)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/*
#Preview {
    ButtonView(title: "", backgroundColor: Color.blue, textColor: Color.white)
}
*/
