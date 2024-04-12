//
//  LoginPageViewModel.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import Foundation


//Data
final class LoginPageViewModel : ObservableObject {
    

    let baseURL = "https://timetonic.com/live/api.php"
    var ou = ""
    @Published var isLoginSuccess = false
    
    func createAppkey(appname: String) async throws -> String {
        //prepare the url
        let parameters = "req=createAppkey&appname=\(appname)"
        guard let requestURL = URL(string: "\(baseURL)?\(parameters)") else { return "URL Error"}
        let request = URLRequest(url: requestURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
        guard authResponse.status == "ok", let appkey = authResponse.appkey else { return "Auth Response Error"}
        print("create app key success")
        return appkey
    }
    
    func userLogin(email: String, password: String, appkey: String) async throws -> String {
        let parameters = "req=createOauthkey&login=\(email)&pwd=\(password)&appkey=\(appkey)"
        guard let requestURL = URL(string: "\(baseURL)?\(parameters)") else { return "URL Error"}
        let request = URLRequest(url: requestURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
        guard loginResponse.status == "ok", let oauthkey = loginResponse.oauthkey else { return "Login Response Error"}
        print("user login success")
        ou = loginResponse.o_u
        return oauthkey
    }
    
    func createSession(oauthkey: String) async throws -> String {
        let parameters = "req=createSesskey&o_u=\(ou)&oauthkey=\(oauthkey)&restrictions="
        guard let requestURL = URL(string: "\(baseURL)?\(parameters)") else { return "URL Error"}
        let request = URLRequest(url: requestURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        let sessionResponse = try JSONDecoder().decode(SessionResponse.self, from: data)
        guard sessionResponse.status == "ok", let sessionKey = sessionResponse.sesskey else { return "Session Response Error"}
        print("session success")
        return sessionKey
    }
}


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
