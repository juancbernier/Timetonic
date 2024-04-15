//
//  BooksRepository.swift
//  Timetonic
//
//  Created by Juan Bernier on 13/04/24.
//

import Foundation




final class Repository {
    
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

//we want to respect the conditions for the domain layer, that is in charge of using special entities ready for use by the UI
extension Repository : ForDomainLayerProtocol {
    func fetchBooks() async -> [UIBookEntity] {
        
        //if we have info in local storage we fetch from there....
        //else we are going to fetch de info from the network call and then we save it in local for next time.
        //in this case we are not going to make a local storage to make stuff a bit more easier
        return await networkManager.fetchBooks().mapToDomain()
    }
}
