//
//  CartView.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartVM: CartViewModel
    
    var body: some View {
        NavigationView {
            
            VStack {
                if cartVM.cartItems.isEmpty {
                    Text("Tu carrito está vacio")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    List {
                        ForEach(cartVM.cartItems) { product in
                            HStack(spacing: 16) {
                                AsyncImage(url: URL(string: product.image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(8)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 80)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(product.title)
                                        .font(.headline)
                                        .lineLimit(2)
                                    
                                    Text("$\(product.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                        }
                    }
                    Button("Total: $\(cartVM.totalPrice(), specifier: "%.2f")") {}
                        .padding()
                        .buttonStyle(.bordered)
                }
            }
            .navigationTitle("Carrito")
        }
    }
}

#Preview {
    ContentView()
}
