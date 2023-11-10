//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

class AsyncCachedImageHandler: ObservableObject {

	@Published private(set) var data: Data?
	private let fetcher = ImageFetcher()

	@MainActor
	func load(
		_ url: String
		// can pass a ImageCache reference here, may want to use different caches
	) async {

		// Check first if image is already in the cache
		if let imageData = ImageCache.shared.object(forkey: url as NSString) {
			self.data = imageData
			print("+* fetching image from the cache:",url)
			return // if there is, use it and do not fetch the webservice
		}

		// The image is not in the cache, so try to fetch it
		do {
			self.data = try await fetcher.getData(url)
			if let cachedData = data as? NSData {
				// Store image fetched in the cache
				ImageCache.shared.set(object: cachedData, forKey: url as NSString)
				print("+* caching image:",url)
			}
		} catch {
			// TODO: handle error while fetching image
			print("* error while fetching data:",error)
		}
	}
}

