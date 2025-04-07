//
//  User.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//
import SwiftUI

struct User: Identifiable, Codable {
    var id: UUID
    var name: String
    var age: Int
}
