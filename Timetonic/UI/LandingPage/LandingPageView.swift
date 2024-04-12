//
//  LandingPage.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI

struct LandingPageView: View {
    @AppStorage("isLoading") var isLoading: Bool?
    var body: some View {
    NavigationStack{
            ScrollView {
                ForEach(0..<10){ index in
                LandingPageCell(name: "Harry Potter", image: "https://timetonic.com/live/dbi/in/tb/FU-1701419839-65699b3f78400/mo dele-suivi-projet.jpg")
                        .padding()
                }
            }
            .navigationTitle("Books")
        }
    .onAppear{
        isLoading = false
    }
    }
}

#Preview {
    LandingPageView()
}
