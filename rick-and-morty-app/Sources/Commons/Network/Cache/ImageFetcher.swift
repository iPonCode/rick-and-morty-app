//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

struct ImageFetcher {

	/*
	/// Can customize the .timeoutIntervalForRequest for fetching image
	/// and use session.data(from: url) instead URLSession.shared.data(from: url)
	private var session: URLSession {
		let configuration = URLSessionConfiguration.default
		configuration.waitsForConnectivity = true
		configuration.timeoutIntervalForRequest = 12
		configuration.timeoutIntervalForResource = 30
		return URLSession(configuration: configuration)
	}
	*/

  func getData(
    _ url: String
  ) async throws -> Data {
    guard let url = URL(string: url) else {
			throw ApiError(
				errorCode: "invalidUrl",
				message: "Invalid Image URL"
			)
    }
		let (data, response) = try await URLSession.shared.data(from: url) // session.data(from: url)
		guard let _ = response as? HTTPURLResponse
		else {
			throw ApiError(
				errorCode: "imageFetcherInvalidResponse",
				message: "Invalid HTTP response Image Fetcher"
			)
		}
    return data
  }
}

