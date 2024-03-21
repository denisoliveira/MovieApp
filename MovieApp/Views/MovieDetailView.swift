//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Denis Oliveira on 21/03/24.
//

import Foundation
import SwiftUI
import Combine

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    init(movie: Movie) {
        self.viewModel = MovieDetailViewModel(movie: movie)
    }

    var body: some View {
        VStack {
            if
                !viewModel.imageData.isEmpty,
                let uiImage = UIImage(data: viewModel.imageData)
            {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
            }
            else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
            }
            Text(viewModel.title)
                .font(.title)
            Text(viewModel.overview)
                .font(.body)
                .padding()
        }
        .padding()
        .navigationTitle(viewModel.title)
    }
}


#Preview {
    MovieDetailView(movie: .empty())
}
