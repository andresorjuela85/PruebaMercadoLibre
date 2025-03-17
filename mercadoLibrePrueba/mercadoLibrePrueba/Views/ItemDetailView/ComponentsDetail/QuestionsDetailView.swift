//
//  QuestionsDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

/// Encabezado de la sección de preguntas, se mostrará independientemente de la cantidad de preguntas que tenga el producto, las cajas no tienen acción de botón.
struct QuestionsDetailView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Preguntas")
                .font(.title3)
                .padding(.bottom, 10)
            
            Text("¿Qué Quieres saber?")
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                HStack {
                    BoxView(text: "Costo y tiempo de envío")
                    BoxView(text: "Devoluciones gratis")
                }
                HStack {
                    BoxView(text: "Medios de pago")
                    BoxView(text: "Garantía")
                }
            }
            
            ButtonView(title: "Preguntar", backgroundColor: Colors.backgroundBlueColor, textColor: .white)
        }
        .padding(.vertical, 10)
    }
}

struct BoxView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Colors.backgroundBlueColor)
            .padding(12)
            .background(Color(red: 225/255, green: 237/255, blue: 251/255))
            .cornerRadius(5)
    }
}

#Preview {
    QuestionsDetailView()
}

