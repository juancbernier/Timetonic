//
//  ContentView.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI



struct ContentView: View {
    @AppStorage("isLogged") var isLogged: Bool?
    @AppStorage("isLoading") var isLoading: Bool = false
    var body: some View {
        ZStack{
       
            if isLogged ?? false{
                LandingPageView()
            }else{
                LoginPageView()
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
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
