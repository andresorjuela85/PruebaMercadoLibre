//
//  AllQuestionsView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

/// Vista que muestra la lista completas de las preguntas y respuestas de cada Item.
struct AllQuestionsView: View {
    
    var questions: [Question]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<questions.count, id: \.self) { question in
                    QuestionView(question: questions[question])
                        .padding(.horizontal)
                        .padding(.bottom)
                }
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
        .edgesIgnoringSafeArea(.horizontal)
        .navigationTitle("Preguntas en esta publicación")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Colors.backgroundYellowColor, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
    }
}

#Preview {
    AllQuestionsView(questions: [])
}
