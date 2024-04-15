//
//  UILayerInterfaces.swift
//  Timetonic
//
//  Created by Juan Bernier on 14/04/24.
//

import Foundation


protocol FetchBookForUILayerProtocol {
    func fetchBooks() async -> [UIBookEntity]
}

protocol UserAuthForUILayerProtocol {
    func login(email: String, password: String) async
}
