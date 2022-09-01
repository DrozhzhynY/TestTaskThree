//
//  ContentView.swift
//  TestTaskThree

import SwiftUI

struct ContentView: View {
    @State private var movies = [String]()
    @State private var movieTitle: String = ""
    @State private var movieYear: Int?
    @State private var duplicate = false
    
    var body: some View {
        VStack {
            TextField("Title", text: $movieTitle)
                .padding([.top, .leading, .trailing])
                .textFieldStyle(.roundedBorder)
            
            TextField("Year", value: $movieYear, format: .number)
                .keyboardType(.numberPad)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            
            if duplicate {
                Text("There cannot be duplicates in the movie list")
                    .font(.footnote)
                    .foregroundColor(Color.red)
            }
            
            Button("Add") {
                addNewMovie()
            }
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
            
            List {
                Section {
                    ForEach(movies, id: \.self) {movie in
                        Text(movie)
                    }
                }
            }
        }
        .onSubmit {
            addNewMovie()
        }
    }
    
    func addNewMovie() {
        guard movieTitle.count > 0 && movieYear != nil else { return }
        let movie = "\(movieTitle) \(movieYear!)"
        if movies.contains(movie) {
            duplicate = true
        } else {
            movies.insert(movie, at: 0)
            duplicate = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
