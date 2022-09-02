//
//  Movie.swift
//  TestTaskThree

import Foundation

struct Movie: Codable, Hashable {
    var title: String = ""
    var year: Int?

    enum CodingKeys: String, CodingKey {
        case title
        case year
    }
    
    init(title: String, year: Int?) {
        self.title = title
        self.year = year
    }
}
