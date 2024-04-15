//
//  LoginUseCase.swift
//  Timetonic
//
//  Created by Juan Bernier on 14/04/24.
//

import SwiftUI


final class LoginUseCase {
    @AppStorage("isLoggedIn") var isLoggedIn : Bool = false
    @AppStorage("sessKey") var sessionKey: String?
    @AppStorage("oAuthUser") var oAuthUser: String?

}

extension LoginUseCase : UserAuthForUILayerProtocol {
    func login(email: String, password: String) async{
        do{
            var parameters = "\(Constants.reqAppKey)&appname=\(Constants.appName)"
            guard let appKeyRequest = URL(string: "\(Constants.url)?\(parameters)") else { return }
            var request = URLRequest(url: appKeyRequest)
            let (appKeyData, _) = try await URLSession.shared.data(for: request)
            let appKeyResponse = try JSONDecoder().decode(AuthResponse.self, from: appKeyData)
            guard appKeyResponse.status == "ok", let appkey = appKeyResponse.appkey else { return }
            print("create app key success")
            
            parameters = "\(Constants.reqOAuthKey)&login=\(email)&pwd=\(password)&appkey=\(appkey)"
            guard let oAuthRequest = URL(string: "\(Constants.url)?\(parameters)") else { return }
            request = URLRequest(url: oAuthRequest)
            let (oAuthData, _) = try await URLSession.shared.data(for: request)
            let oAuthResponse = try JSONDecoder().decode(LoginResponse.self, from: oAuthData)
            guard oAuthResponse.status == "ok", let oauthkey = oAuthResponse.oauthkey else { return }
            print("OAuth login success")
            
            parameters = "\(Constants.reqSessionKey)&o_u=\(oAuthResponse.o_u)&oauthkey=\(oauthkey)"
            guard let sessionKeyRequest = URL(string: "\(Constants.url)?\(parameters)") else { return }
            request = URLRequest(url: sessionKeyRequest)
            let (sessionKeyData, _) = try await URLSession.shared.data(for: request)
            let sessionKeyResponse = try JSONDecoder().decode(SessionResponse.self, from: sessionKeyData)
            guard sessionKeyResponse.status == "ok", let sessionKey = sessionKeyResponse.sesskey else { return }
            print("session success")
            
            self.oAuthUser = oAuthResponse.o_u
            self.sessionKey = sessionKey
            isLoggedIn = true
            
        }catch{
            print(error.localizedDescription)
        }
    }
}
