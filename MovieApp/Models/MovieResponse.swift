//
//  MovieResponse.swift
//  MovieApp
//
//  Created by Denis Oliveira on 21/03/24.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }

    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}

extension Movie {
    static func empty() -> Movie {
        return Movie(
            id: 0,
            title: "Title Empty",
            overview: "Overview Empty",
            posterPath: nil,
            releaseDate: "2024-01-01",
            voteAverage: 0.0
        )
    }
}
