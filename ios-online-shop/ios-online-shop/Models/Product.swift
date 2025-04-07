//
//  Product.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//
import Foundation

struct Product: Identifiable, Codable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}
