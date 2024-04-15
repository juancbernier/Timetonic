//
//  LandingPageView.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI

struct LoginPageView: View {
    @Binding var isLoadingResponse: Bool
    @EnvironmentObject var vm : LoginPageViewModel
    @State private var email: String = "android.developer@timetonic.com"
    @State private var password: String = "Android.developer1"
    var body: some View {
        
        VStack(spacing: 20){
            headerSection
            emailSection
            passwordSection
            buttonSection
            Spacer()
        }
        .padding(.horizontal)
        
    }
    
}


extension LoginPageView{
    var headerSection: some View{
        VStack(spacing: 10){
            Text("Login")
                .foregroundStyle(Color.timeTonic)
                .font(.title)
                .fontWeight(.heavy)
            
            Text("Please login to continue")
                .foregroundStyle(Color.black.opacity(0.5))
        }
        .padding(.bottom, 50)
        .padding(.top, 100)
    }
    
    var emailSection: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Email Address")
                .withCustomLabelStyle()
                .padding(.leading)
            TextField("example@test...", text: $email)
                .withCustomTextFieldStyle()
        }
    }
    
    var passwordSection: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Password")
                .withCustomLabelStyle()
                .padding(.leading)
            SecureField("********", text: $password)
                .withCustomTextFieldStyle()
        }
    }
    
    var buttonSection: some View{
        Button(action: {
            withAnimation {
                isLoadingResponse = true
            }
            login()
        }, label: {
            Text("Login")
                .withCustomButtonStyle()
        })
    }
    
    
    //ViewModel
    private func login() {
        Task{
            await vm.login(email: email, password: password)
        }
    }
}
#Preview {
    LoginPageView(isLoadingResponse: .constant(false))
        .environmentObject(LoginPageViewModel(loginUseCase: LoginUseCase()))
}
