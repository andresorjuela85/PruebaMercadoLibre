//
//  QuestionView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 15/03/25.
//

import SwiftUI

struct QuestionView: View {
    
    var question: Question
    var date = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let title = question.text {
                Text(title)
            }
            
            if question.status == "ANSWERED" {
                HStack(alignment: .top) {
                    Image(systemName: "chevron.left")
                        .rotationEffect(.degrees(-45))
                        .font(.title3)
                        .foregroundStyle(.gray)
                    Text((question.answer?.text ?? "") + " " + (date.stringToDate(string: question.dateCreated ?? "") ?? ""))
                        .font(.callout)
                        .foregroundStyle(.gray)
                        .padding(.top, 10)
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    QuestionView(
        question: Question(
            dateCreated: "",
            status: "",
            text: "",
            id: 0,
            answer: Answer(text: "", status: "", dateCreated: "")
        )
    )
}
