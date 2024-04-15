//
//  BookDTO.swift
//  Timetonic
//
//  Created by Juan Bernier on 13/04/24.
//

import Foundation


struct TimetonicDTO: Codable {
    let status: String
    let allBooks: AllBooks
}

struct AllBooks: Codable {
    let books: [Book]
}

struct Book : Codable , Hashable{
    let ownerPrefs: BookImageCover
    let b_c: String
}

struct BookImageCover: Codable, Hashable{
    let oCoverImg : String?
}


extension [Book] {
    func mapToDomain() -> [UIBookEntity] {
        var arrayOfUIBooksEntity : [UIBookEntity] = []
        for book in self {
            if let coverImage = URL(string: book.ownerPrefs.oCoverImg ?? "") {
                arrayOfUIBooksEntity.append(UIBookEntity(name: book.b_c, imageURL: coverImage))
            }
        }
        return arrayOfUIBooksEntity
    }
}
