//
//  FetchBooks.swift
//  Timetonic
//
//  Created by Juan Bernier on 13/04/24.
//

import Foundation


final class FetchBooksUseCase{
    let repository : ForDomainLayerProtocol
    init(repository: ForDomainLayerProtocol) {
        self.repository = repository
    }
}

extension FetchBooksUseCase : FetchBookForUILayerProtocol{
    func fetchBooks() async -> [UIBookEntity] {
        //here because here we have usually some of the "business logic" we have to make our filters, but because i just oriented the DTO to read the ones that aren't the "contact books" ones... we good.
        await repository.fetchBooks()
    }
}
