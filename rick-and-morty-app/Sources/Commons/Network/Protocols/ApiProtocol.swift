//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

protocol ApiProtocol {

	func asyncRequest<T: Decodable>(
		endpoint: EndpointProvider,
		responseModel: T.Type,
		addAditionalHeaders: Bool
	) async throws -> T
}

