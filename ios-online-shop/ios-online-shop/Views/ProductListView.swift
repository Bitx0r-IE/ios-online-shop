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
    
    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductCartView(product: product)
                }
            }
            .navigationTitle("Productos")
        }
    }
}

#Preview {
    ProductListView()
}
