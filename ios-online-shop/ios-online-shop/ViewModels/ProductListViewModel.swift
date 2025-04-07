//
//  ProductListViewModel.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//
import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        APIService.shared.fetchProducts { products in
            self.products = products
        }
    }
}
