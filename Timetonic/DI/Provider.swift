//
//  Provider.swift
//  Timetonic
//
//  Created by Juan Bernier on 14/04/24.
//

import SwiftUI


final class Provider : ObservableObject{
    private let remoteDataSource: NetworkManagerProtocol
    private let repository : ForDomainLayerProtocol
    private let fetchBookUseCase : FetchBookForUILayerProtocol
    private let loginUseCase : UserAuthForUILayerProtocol
    @Published var loginViewModel:  LoginPageViewModel
    @Published var  landingPageViewModel: LandingPageViewModel
    
    init() {
        //NECESSARY RESOURCES FOR LOGIN PAGE
        self.loginUseCase = LoginUseCase()
        self.loginViewModel = LoginPageViewModel(loginUseCase: loginUseCase)
        
        //NECESSARY RESOURCES FOR LANDING PAGE
        self.remoteDataSource = NetworkManager()
        self.repository = Repository(networkManager: remoteDataSource)
        self.fetchBookUseCase = FetchBooksUseCase(repository: repository)
        self.landingPageViewModel = LandingPageViewModel(fetchBookUseCase: fetchBookUseCase)
    }

}


