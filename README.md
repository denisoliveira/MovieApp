# MovieApp

MovieApp is a mobile application developed in Swift using SwiftUI. It allows users to browse for movie titles using the [The Movie Database (TMDb) API](https://www.themoviedb.org/documentation/api).

## Features

- Browse a list of movie titles
- View movie details including images, title, overview

## Requirements

- iOS 17.4+
- Xcode 15.3+
- Swift 5.10+

## Installation

1. Clone the repository
2. Open `MovieApp.xcodeproj` in Xcode
3. Build and run the app on a simulator or device

## Configuration

To use the app, you'll need to obtain an API key from [TMDb](https://www.themoviedb.org/documentation/api) and add it to the `MovieService.swift` file.

```swift
...
let apiKey: String = "YOUR KEY"
...
```

## Acknowledgements

- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [Combine](https://developer.apple.com/documentation/combine)
- [The Movie Database (TMDb) API](https://www.themoviedb.org/documentation/api)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
