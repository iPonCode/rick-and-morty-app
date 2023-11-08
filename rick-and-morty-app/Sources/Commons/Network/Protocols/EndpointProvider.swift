//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

protocol EndpointProvider {
	var scheme: String { get }
	var baseURL: String { get }
	var path: String { get }
	var method: RequestMethod { get }
	var token: String { get }
	var queryItems: [URLQueryItem]? { get }
	var body: [String: Any]? { get }
	var mockFile: String? { get }
}

extension EndpointProvider {

	var scheme: String {
		"https"
	}

	var baseURL: String {
		"rickandmortyapi.com"
	}

	var token: String {
		"" // recover token from keychain when necessary
	}

	func asURLRequest(
		_ addAditionalHeaders: Bool = true
	) throws -> URLRequest {

		var urlComponents = URLComponents()
		urlComponents.scheme = scheme
		urlComponents.host =  baseURL
		urlComponents.path = path

		if let queryItems = queryItems {
			urlComponents.queryItems = queryItems
		}

		guard let url = urlComponents.url else {
			throw ApiError(
				errorCode: "url",
				message: "URL error"
			)
		}

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = method.rawValue

		if addAditionalHeaders {
			urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
			urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
			urlRequest.addValue("true", forHTTPHeaderField: "X-Use-Cache")
		}

		if !token.isEmpty { // Use token if present
			urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
		}

		if let body {
			urlRequest.httpBody = body.percentEncoded()
		}

		return urlRequest
	}
}

