//
//  LoginResponse.swift
//  ios-online-shop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct LoginResponse: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let user: User
}
