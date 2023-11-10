//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

struct ImageFetcher {

  func getData(
    _ url: String
  ) async throws -> Data {
    guard let url = URL(string: url) else {
			throw ApiError(
				errorCode: "invalidUrl",
				message: "Invalid Image URL"
			)
    }
    let (data, response) = try await URLSession.shared.data(from: url)
		guard let response = response as? HTTPURLResponse
		else {
			throw ApiError(
				errorCode: "imageFetcher",
				message: "Invalid HTTP response Image Fetcher"
			)
		}
    return data
  }
}

