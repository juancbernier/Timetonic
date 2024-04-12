//
//  LandingPageView.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI

struct LoginPageView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
            
            VStack(spacing: 20){
                headerSection
                    .padding(.bottom, 50)
                    .padding(.top, 50)
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
            //action
        }, label: {
            Text("Login")
        })
        .withCustomButtonStyle()
    }
}

#Preview {
    LoginPageView()
}
