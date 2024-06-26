//
//  LandingPageViewModel.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI

protocol LandingPageViewModelProtocol {
    func updateBooks() async
}

final class LandingPageViewModel : ObservableObject {
    
    @Published var books: [UIBookEntity] = []
    let fetchBookUseCase: FetchBookForUILayerProtocol
    
    init(fetchBookUseCase: FetchBookForUILayerProtocol) {
        self.fetchBookUseCase = fetchBookUseCase
    }
}



extension LandingPageViewModel: LandingPageViewModelProtocol {
    @MainActor // this should help us to maintain the functionality in the main thread, but for some reason the Thread error still displays
    func updateBooks() async {
        //We catch the "filtered books" and update the books publisher
        books = await fetchBookUseCase.fetchBooks()
    }
}
