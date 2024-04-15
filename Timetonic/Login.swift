//
//  Login.swift
//  Timetonic
//
//  Created by Juan Bernier on 14/04/24.
//

import Foundation

struct AuthResponse: Codable {
    let status: String?
    let appkey: String?
    let req: String
    let errorMsg: String?
}

struct LoginResponse: Codable {
    let status: String
    let o_u: String
    let oauthkey: String?
}

struct SessionResponse: Codable {
    let status: String
    let sesskey: String?
}
