//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

protocol Mapper {

	associatedtype In
	associatedtype Out

	static func map(
		_ from : In
	) -> Out
}

