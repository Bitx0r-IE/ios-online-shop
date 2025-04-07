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
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            
            Text(product.title)
                .font(.headline)
            
            Text(product.description)
                .font(.body)
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.title2)
                .bold()
            
            Button("Agregar al carrito") {
                cartVM.addToCart(product)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalle")
    }
}

