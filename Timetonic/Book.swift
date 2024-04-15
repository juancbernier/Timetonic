//
//  Book.swift
//  Timetonic
//
//  Created by Juan Bernier on 13/04/24.
//

import Foundation

//we added the Hashable so we do not need to add the
//"identifiable UUID" and just use the unique string id when calling the entity into the UI
struct UIBookEntity: Hashable {
    let name: String
    let imageURL : String
}
