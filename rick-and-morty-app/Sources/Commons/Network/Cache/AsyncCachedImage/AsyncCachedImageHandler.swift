//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

class AsyncCachedImageHandler: ObservableObject {

	@Published private(set) var state: AsyncCachedImageState = .idle
	private let fetcher = ImageFetcher()

	@MainActor
	func load(
		_ url: String
		// can pass a ImageCache reference here, may want to use different caches
	) async {

		state = .fetching

		// Check first if image is already in the cache
		if let imageData = ImageCache.shared.object(forkey: url as NSString) {
			state = .success(imageData)
			logOperation(.cache, key: url)
			return // if there is, use it and do not fetch the webservice
		}

		// The image is not in the cache, so try to fetch it from the network
		do {
			let cachedData = try await fetcher.getData(url)
			state = .success(cachedData)
			// Store image fetched in the cache
			ImageCache.shared.set(
				object: cachedData as NSData,
				forKey: url as NSString
			)
			logOperation(.network, key: url)

		} catch {
			// handle error while fetching image
			state = .failure(ApiError(
				errorCode: "fetchingImage",
				message: error.localizedDescription
			))
      debugLog("error while fetching data: \(error)")
		}
	}
}

private extension AsyncCachedImageHandler {
	enum LogSource: String { case network, cache }
	func logOperation(_ source: LogSource, key: String) {
		let message = "fetching " + "…" + key.last(15) + " from " + source.rawValue.uppercased()
    debugLog(message)
	}
}

