//
//  BooksProtocol.swift
//  Timetonic
//
//  Created by Juan Bernier on 13/04/24.
//

import Foundation

// this interface is going to be in charge of telling the whatever Data layer what do they have to conform in case they want to be connected with the Domain layer , so we respect the Layer Arquitecture
protocol ForDomainLayerProtocol {
    func fetchBooks() async -> [UIBookEntity]
}
