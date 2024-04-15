//
//  BookDTO.swift
//  Timetonic
//
//  Created by Juan Bernier on 13/04/24.
//

import Foundation


struct TimetonicDTO: Decodable {
    let status: String
    let allBooks: AllBooks
}

struct AllBooks: Decodable {
    let books: [Book]
}

struct Book : Decodable{
   let ownerPrefs: BookImageCover
    let b_c: String
}

struct BookImageCover: Decodable{
    let oCoverImg : String
}


extension [Book] {
    func mapToDomain() -> [UIBookEntity] {
        var arrayOfUIBooksEntity : [UIBookEntity] = []
        for book in self {
            let newBook = UIBookEntity(name: book.b_c, imageURL: book.ownerPrefs.oCoverImg)
                arrayOfUIBooksEntity.append(newBook)
            }
        return arrayOfUIBooksEntity
    }
}
