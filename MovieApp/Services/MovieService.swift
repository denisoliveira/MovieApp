//
//  MovieService.swift
//  MovieApp
//
//  Created by Denis Oliveira on 21/03/24.
//

import Foundation

class MovieService {

    let urlSession: URLSession
    let apiKey: String = <#T##String: Add your API key#>

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchMovies() async throws -> [Movie] {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")!
        let (data, _) = try await urlSession.data(from: url)
        let decoder = JSONDecoder()
        let moviewResponse = try decoder.decode(MovieResponse.self, from: data)
        return moviewResponse.results
    }
}
