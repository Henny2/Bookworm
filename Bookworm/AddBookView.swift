//
//  AddBookView.swift
//  Bookworm
//
//  Created by Henrieke Baunack on 12/13/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var rating = 3
    @State private var review = ""
    @State private var bookFinishDate = Date.now
    var formIsEmpty: Bool {
        let nameIsSet = title.count > 0
        let authorIsSet = author.count > 0
        let reviewIsSet = review.count > 0
        return !nameIsSet || !authorIsSet || !reviewIsSet
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id:\.self) {
                            Text($0)
                        }
                    }
                    DatePicker(
                            "When did you finish this book?",
                            selection: $bookFinishDate,
                            displayedComponents: [.date]
                        )
                }
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                Section {
                    Button("Save"){
                       let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, readDate: bookFinishDate)
                        modelContext.insert(newBook)
                        dismiss()
                        
                    }
                }.disabled(formIsEmpty)
            }.navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
