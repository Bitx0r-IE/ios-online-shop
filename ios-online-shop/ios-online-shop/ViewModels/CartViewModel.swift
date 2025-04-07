//
//  CartViewModel.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//
import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [Product] = [] {
        didSet {
            saveCart()
        }
    }
    
    init() {
        loadCart()
    }
    
    func addToCart(_ product: Product) {
        cartItems.append(product)
    }
    
    func totalPrice() -> Double {
        cartItems.reduce(0) { $0 + $1.price }
    }
    
    private func saveCart() {
        if let data = try? JSONEncoder().encode(cartItems) {
            UserDefaults.standard.set(data, forKey: "cart")
        }
    }
    
    private func loadCart() {
        if let data = UserDefaults.standard.data(forKey: "cart"),
           let savedItems = try? JSONDecoder().decode([Product].self, from: data) {
            self.cartItems = savedItems
        }
    }
}
