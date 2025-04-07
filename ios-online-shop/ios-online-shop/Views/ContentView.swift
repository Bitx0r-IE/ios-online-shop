//
//  Main.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartVM = CartViewModel()
    @StateObject private var authVM = AuthViewModel()
    
    var body: some View {
        TabView {
            ProductListView()
                .environmentObject(cartVM)
                .tabItem {
                    Label("Tienda", systemImage: "cart")
                }
            
            UserView(authVM: authVM)
                .tabItem {
                    Label("Usuario", systemImage: "person.fill")
                }
            
            CartView()
                .environmentObject(cartVM)
                .tabItem {
                    Label("Carrito", systemImage: "bag")
                }
                .badge(cartVM.cartItems.count)
        }
    }
}

#Preview {
    ContentView()
}
