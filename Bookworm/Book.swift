//
//  Book.swift
//  Bookworm
//
//  Created by Henrieke Baunack on 12/13/23.
//

import Foundation
import SwiftData


// need to read this on migration
// https://www.hackingwithswift.com/quick-start/swiftdata/lightweight-vs-complex-migrations#:~:text=SwiftData%20will%20execute%20lightweight%20migration,Renaming%20one%20or%20more%20properties.

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
//    var readDate = Date()
    var readDate: Date?
    
    init(title: String, author: String, genre: String, review: String, rating: Int, readDate: Date?) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.readDate = readDate
    }
}
