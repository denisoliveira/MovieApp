//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Denis Oliveira on 21/03/24.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let movieService = MovieService()

    func fetchMovies() async {
        (try? await movieService.fetchMovies()).flatMap { movies in
            DispatchQueue.main.async {
                self.movies = movies
            }
        }
    }
}
