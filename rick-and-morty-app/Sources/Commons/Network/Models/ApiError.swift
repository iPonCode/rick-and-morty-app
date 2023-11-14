//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

struct ApiError: Error {

	var statusCode: Int?
	let errorCode: String
	var message: String

	init(
		statusCode: Int? = nil,
		errorCode: String,
		message: String
	) {

		self.statusCode = statusCode
		self.errorCode = errorCode
		self.message = message
	}

	var errorCodeNumber: String {
		errorCode
			.components(
				separatedBy: CharacterSet.decimalDigits.inverted
			)
			.joined()
	}

	private enum CodingKeys: String, CodingKey {
		case errorCode
		case message
	}
}

extension ApiError: Decodable {

	init(
		from decoder: Decoder
	) throws {

		let container = try decoder.container(keyedBy: CodingKeys.self)
		errorCode = try container.decode(String.self, forKey: .errorCode)
		message = try container.decode(String.self, forKey: .message)
	}
}

