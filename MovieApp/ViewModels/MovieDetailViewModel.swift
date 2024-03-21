//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Denis Oliveira on 21/03/24.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var imageData = Data()
    private var cancellable: AnyCancellable?

    private let movie: Movie

    var title: String {
        get { return movie.title}
    }

    var overview: String {
        get { return movie.overview }
    }

    init(movie: Movie) {
        self.movie = movie

        guard let posterURL = movie.posterURL else {
            return
        }

        self.cancellable = URLSession.shared.dataTaskPublisher(for: posterURL)
            .map(\.data)
            .replaceError(with: Data())
            .receive(on: DispatchQueue.main)
            .assign(to: \.imageData, on: self)
    }
}
