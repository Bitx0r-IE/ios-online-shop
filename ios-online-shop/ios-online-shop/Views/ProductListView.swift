//
//  ContentView.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ProductListViewModel()
    @EnvironmentObject var cartVM: CartViewModel
    @State private var selectedProduct: Product?
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.products) { product in
                    ProductCartView(product: product)
                        .onTapGesture {
                            selectedProduct = product
                            showDetail = true
                        }
                }
                .navigationTitle("Productos")
            }
            .blur(radius: showDetail ? 4 : 0) // BONUS2: Difumina el fondo
            .disabled(showDetail) // Evita que se mueva
            
            if let product = selectedProduct, showDetail {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showDetail = false
                    }
                
                ProductDetailView(product: product, isPresented: $showDetail)
                    .environmentObject(cartVM)
                    .transition(.scale)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showDetail)
    }
}

#Preview {
    ProductListView()
}
