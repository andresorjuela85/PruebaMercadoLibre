//
//  ProductDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

/// Vista de detalle del producto, aparecerá en el momento de escoger un producto de la lista de busqueda, al final de la vista si se tienen preguntas del consumidor, se podrá ir a una nueva vista en donde se ve la lista completa.
struct ItemDetailView: View {
    
    @State var viewModel: ItemDetailViewModel
    
    init(item: SearchItem) {
        self.viewModel = ItemDetailViewModel(item: item)
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoaderView()
            } else {
                if let detailItem = viewModel.detailItem {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            HeaderDetailView(new: detailItem.condition ?? "", title: detailItem.title)
                                .padding(.horizontal)
                            
                            PicturesDetailView(count: detailItem.pictures.count, pictures: detailItem.pictures)
                            
                            ColorDetailView(attributes: detailItem.attributes)
                                .padding(.horizontal)
                            
                            PriceDetailView(originalPrice: viewModel.item.originalPrice, price: viewModel.item.price, installments: viewModel.item.installments)
                                .padding(.horizontal)
                            
                            if let shipping = detailItem.shipping {
                                ShippingDetailView(freeShipping: shipping.freeShipping ?? false, localShipping: shipping.localPickUp ?? false, storeShipping: shipping.storePickUp ?? false)
                                    .padding(.horizontal)
                            }
                            
                            if let available = viewModel.item.availableQuantity {
                                StockDetailView(quantity: available)
                                    .padding(.horizontal)
                            }
                            
                            if let warranty = detailItem.warranty {
                                WarrantyDetailView(warranty: warranty)
                                    .padding(.horizontal)
                            }
                            
                            Divider()
                            
                            if let descriptionItem = viewModel.descriptionItem?.plainText {
                                if !descriptionItem.isEmpty {
                                    DescriptionView(description: descriptionItem)
                                        .padding(.horizontal)
                                    
                                    Divider()
                                }
                            }
                            
                            QuestionsDetailView()
                                .padding(.horizontal)
                            
                            AnswerView
                        }
                    }
                    .scrollIndicators(.hidden)
                    .edgesIgnoringSafeArea(.horizontal)
                } else {
                    RetryView {
                        viewModel.getData()
                    }
                }
            }
        }
        .navigationTitle("Detalle del producto")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Colors.backgroundYellowColor, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        .onAppear {
            viewModel.getData()
        }
    }
    
    private var AnswerView: some View {
        
        VStack {
            if let questionsResult = viewModel.questionsItem {
                if questionsResult.total > 1 {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Últimas realizadas")
                            .fontWeight(.semibold)
                        
                        if let question = questionsResult.questions {
                            QuestionView(question: question[0])
                            
                            QuestionView(question: question[1])
                        }
                    }
                    .padding(.horizontal)
                    
                    NavigationLink {
                        if let allQuestion = questionsResult.questions {
                            AllQuestionsView(questions: allQuestion)
                        }
                    } label: {
                        
                        HStack {
                            
                            Text("Ver todas las preguntas")
                                .font(.callout)
                                .foregroundStyle(Color.blue)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.callout)
                                .foregroundColor(Color.blue)
                        }
                        .frame(height: 50)
                        .padding(.horizontal, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color.gray)
                        )
                    }
                    .padding(.horizontal)
                    .cornerRadius(8)
                }
            }
        }  
    }
}

#Preview {
    ItemDetailView(
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
