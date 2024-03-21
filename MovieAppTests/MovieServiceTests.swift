//
//  MovieServiceTests.swift
//  MovieAppTests
//
//  Created by Denis Oliveira on 21/03/24.
//

import XCTest
@testable import MovieApp

enum GenericError: Error {
    case apiError
}

final class MovieServiceTests: XCTestCase {

    var service: MovieService!

    private func mockClean() {
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = nil
    }

    private func mockSuccess() {
        let response = """
                     {
                       "results": [
                         {
                           "adult": false,
                           "backdrop_path": "/mExN6lJHmLeGjwDmDrNNjR4MdCq.jpg",
                           "genre_ids": [
                             28,
                             12,
                             16,
                             35,
                             10751
                           ],
                           "id": 1,
                           "original_language": "en",
                           "original_title": "Original Title Test 1",
                           "overview": "Overview Test 1",
                           "popularity": 1,
                           "poster_path": "/wYOuMSTR5D0dSwtqjYq59aqziT1.jpg",
                           "release_date": "2024-01-01",
                           "title": "Title Test 1",
                           "video": false,
                           "vote_average": 1.0,
                           "vote_count": 1
                         },
                         {
                           "adult": false,
                           "backdrop_path": "/deLWkOLZmBNkm8p16igfapQyqeq.jpg",
                           "genre_ids": [
                             14,
                             12,
                             28
                           ],
                           "id": 2,
                           "original_language": "en",
                           "original_title": "Original Title Test 2",
                           "overview": "Overview Test 2",
                           "popularity": 2,
                           "poster_path": "/sMp34cNKjIb18UBOCoAv4DpCxwY.jpg",
                           "release_date": "2024-01-01",
                           "title": "Title Test 2",
                           "video": false,
                           "vote_average": 2.0,
                           "vote_count": 2
                         }
                       ]
                     }
                     """
        let data = response.data(using: .utf8)!
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: URL(string: "https://test.local.com/test")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            return (response, data)
        }
    }

    private func mockError() {
        MockURLProtocol.error = GenericError.apiError
        MockURLProtocol.requestHandler = nil
    }

    override func setUpWithError() throws {
        service = MovieService(urlSession: MockUtils.generateURLSession())
    }

    override func tearDownWithError() throws {
    }

    func test_fetchMovies_sucess() async throws {
        mockSuccess()
        let result = try await service.fetchMovies()
        XCTAssertEqual(result.count, 2, "Expect 2 results, but got \(result.count).")

        let movie = result.first!
        XCTAssertEqual(movie.title, "Title Test 1", "Expect 'Tittle Test 1' but got a '\(movie.title)'")
    }

    func test_fetchMovies_fail() async throws {
        mockError()
        do {
            let _ = try await service.fetchMovies()
            XCTFail("Expect an error, but got a success result.")
        }
        catch {
        }
    }

}
