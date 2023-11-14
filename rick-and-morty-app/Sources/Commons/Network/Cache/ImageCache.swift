//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

class ImageCache {

	/// class and not struct, this will be used inside a SwiftUI View, don't want can be reset in a UI update
	/// Need a Singleton pattern to guard that only one instance are running
	static let shared = ImageCache()
	private init() {}

	/// Using NSCache, the image url as its key and the data associated with that image as value
	typealias ImageCacheType = NSCache<NSString, NSData>

	/// Do not inicialize until will be used
	private lazy var cache: ImageCacheType = {
		let cache = ImageCacheType()
		// The Rick and Mortty Characters full list API currently has
		// 826 records with one image each, using this for the maximum
		// number of objects the cache should hold
		cache.countLimit = 826
		// Consider typically, the obvious cost is the size of the value in bytes
		cache.totalCostLimit = 826 * 30 * 1024 // 25 Mb, each image is about 30kb aprox.
		return cache
	}()

}

// MARK: - Exposed Methods
extension ImageCache {
	func object(forkey key: NSString) -> Data? {
		cache.object(forKey: key) as? Data
	}

	func set(object: NSData, forKey key: NSString) {
		cache.setObject(object, forKey: key)
	}
}

