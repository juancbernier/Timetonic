//
//  ContentView.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI



struct MainView: View {
    @StateObject var provider = Provider()
    @AppStorage("isLoggedIn") var isLoggedIn : Bool?
    @State var isLoading: Bool = false

    var body: some View {
        ZStack{
            if isLoggedIn ?? false{
                LandingPageView(isLoading: $isLoading)
            }else{
                LoginPageView(isLoadingResponse: $isLoading)
            }
            if isLoading{
                Color.gray.opacity(0.5)
                Rectangle()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .overlay {
                        VStack(spacing: 20){
                            ProgressView()
                            Text("Loggin In")
                        }
                    }
            }

        }
        .environmentObject(provider.landingPageViewModel)
        .environmentObject(provider.loginViewModel)
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
