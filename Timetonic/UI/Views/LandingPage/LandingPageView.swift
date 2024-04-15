//
//  LandingPage.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI

struct LandingPageView: View {
    @EnvironmentObject var vm :  LandingPageViewModel
    @Binding var isLoading: Bool
    
    var body: some View {
    NavigationStack{
            ScrollView {
                ForEach(vm.books, id: \.self){ book in
                    LandingPageCell(name: book.name, image: book.imageURL)
                }
            }
            .scrollIndicators(.hidden)
            .frame(width: UIScreen.main.bounds.width / 1.1)
            .navigationTitle("Books")
        }
    .onAppear{
            withAnimation {
                isLoading = false
                Task{
                    vm.updateBooks
                }
            }
        }
    }
}

#Preview {
    
    LandingPageView( isLoading: .constant(false))
        .environmentObject(Provider().landingPageViewModel)
}
