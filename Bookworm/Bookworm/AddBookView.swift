//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ramon Felix on 17/07/22.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext)var moc
    @Environment(\.dismiss)var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    var isValidBook: Bool {
        if title.isEmpty || author.isEmpty || genre.isEmpty ||
            title.trimmingCharacters(in: .whitespaces).isEmpty ||
            author.trimmingCharacters(in: .whitespaces).isEmpty ||
            genre.trimmingCharacters(in: .whitespaces).isEmpty
        {
            return false
        }
        return true
    }
    let genres = ["Fantasy","Horror","Kids","Mistery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author´s Name", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }header: {
                    Text("Write a review")
                }
                Section{
                    Button("Save"){
                        //add the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now
                        try? moc.save()
                        dismiss()
                        
                    }
                }
                .disabled(isValidBook==false)
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
