//
//  PicturesDetailView.swift
//  mercadoLibrePrueba
//
//  Created by Andres Camilo Orjuela Hurtado on 14/03/25.
//

import SwiftUI

struct PicturesDetailView: View {
    
    @State private var selectedImageIndex: Int = 0
    var count: Int
    var pictures: [Picture]
    let grayColor: Color = Color(red: 245/255, green: 245/255, blue: 245/255)
    
    var body: some View {
        
        ZStack {
            VStack {
                TabView(selection: $selectedImageIndex) {
                    ForEach(0..<count, id: \.self) { index in
                        ZStack(alignment: .topLeading) {
                            
                            if let imageURL = pictures[index].secureURL {
                                AsyncImage(url: URL(string: imageURL)) {
                                    image in
                                    image.image?.resizable()
                                }
                                .scaledToFit()
                            }
                        }
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<count, id: \.self) { index in
                        Circle()
                            .fill(selectedImageIndex == index ? Color.blue : grayColor)
                            .frame(height: 8)
                            .onTapGesture {
                                selectedImageIndex = index
                            }
                    }
                }
            }
            
            Capsule()
                .frame(width: 50, height: 25)
                .foregroundStyle(grayColor)
                .overlay(
                    Text("\(selectedImageIndex + 1)/\(pictures.count)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                )
                .position(x: 40, y: 30)
        }
    }
}

#Preview {
    PicturesDetailView(count: 0, pictures: [])
}
