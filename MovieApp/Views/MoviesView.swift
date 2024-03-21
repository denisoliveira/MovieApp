//
//  MoviesView.swift
//  MovieApp
//
//  Created by Denis Oliveira on 21/03/24.
//

import Foundation
import SwiftUI

struct MoviesView: View {
    @ObservedObject var viewModel = MoviesViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink(value: movie) {
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text(movie.overview)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Movies")
            .navigationDestination(for: Movie.self, destination: { item in
                MovieDetailView(movie: item)
            })
            .onAppear {
                Task {
                    await viewModel.fetchMovies()
                }
            }
        }
    }
}

#Preview {
    MoviesView()
}
