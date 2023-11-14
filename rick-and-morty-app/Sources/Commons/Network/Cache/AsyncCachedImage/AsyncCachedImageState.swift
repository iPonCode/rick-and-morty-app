//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

enum AsyncCachedImageState {
	case idle,
			 fetching,
			 success(_ image: Data),
			 failure(_ error: ApiError)
}

