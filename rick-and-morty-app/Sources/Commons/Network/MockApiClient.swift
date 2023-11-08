//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

class MockApiClient: Mockable,
										 ApiProtocol {

	func asyncRequest<T>(
		endpoint: EndpointProvider,
		responseModel: T.Type,
		addAditionalHeaders: Bool = true
	) async throws -> T where T: Decodable {

		loadJSON(
			filename: endpoint.mockFile!,
			type: responseModel.self
		)
	}
}

