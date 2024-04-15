//
//  LoginPageViewModel.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI


protocol LoginPageViewModelProtocol {
    func login(email: String, password: String) async
}

final class LoginPageViewModel : ObservableObject {
    let loginUseCase : UserAuthForUILayerProtocol
    
    init(loginUseCase: UserAuthForUILayerProtocol) {
        self.loginUseCase = loginUseCase
    }
}


extension LoginPageViewModel : LoginPageViewModelProtocol{
    
    func login(email: String, password: String) async {
        await loginUseCase.login(email: email, password: password)
    }
    
}
