//
//  ProductDetailView.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartVM: CartViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(20)
                .padding()
                .shadow(radius: 20)
            
            
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                
                Text(product.title)
                    .font(.headline)
                
                HStack(spacing: 2) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(product.rating.rate.rounded()) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                    Text("(\(product.rating.count))")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
                Text(product.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                
                Button("Agregar al carrito") {
                    cartVM.addToCart(product)
                    isPresented = false
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
            .padding()
            
        }
        .frame(maxWidth: 350, maxHeight: 600)
    }
}

