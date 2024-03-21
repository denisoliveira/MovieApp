//
//  MockUtils.swift
//  MovieAppUITests
//
//  Created by Denis Oliveira on 21/03/24.
//

import Foundation

class MockUtils {
     class func generateURLSession() -> URLSession {
        let configuration: URLSessionConfiguration = .ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
}
