//
//  APIService.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//
import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        guard let url = URL(string: "\(API.baseURL)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            if let products = try? JSONDecoder().decode([Product].self, from: data) {
                DispatchQueue.main.async {
                    completion(products)
                }
            }
        }.resume()
    }
}
