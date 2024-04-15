//
//  RemoteBooksDataSource.swift
//  Timetonic
//
//  Created by Juan Bernier on 13/04/24.
//

import SwiftUI


protocol NetworkManagerProtocol {
    func fetchBooks() async -> [Book]
}

final class NetworkManager : NetworkManagerProtocol {
    //so i added this user defaults ones to avoid connecting the use case of the login into the Data layer, regarding this is a simple app.
    @AppStorage("sessKey") var sessionKey: String?
    @AppStorage("oAuthUser") var oAuthUser: String?

    func fetchBooks() async -> [Book] {
        guard let session = sessionKey, let oAuth = oAuthUser else { return [] }
            let parameters = "req=getAllBooks&o_u=\(oAuth)&u_c=\(oAuth)&sesskey=\(session)"
            guard let requestURL = URL(string: "\(Constants.url)?\(parameters)") else { return [] }
            let request = URLRequest(url: requestURL)
            do{
                let (data, _) = try await URLSession.shared.data(for: request)
                let decodedData = try JSONDecoder().decode(TimetonicDTO.self, from: data)
                print("2")
                guard decodedData.status == "ok" else  { return [] }
                print("\(decodedData.allBooks.books)\nFetched data with success")
                return  decodedData.allBooks.books
            }catch{
                print(error.localizedDescription)
            }
        return []
    }
    
}
