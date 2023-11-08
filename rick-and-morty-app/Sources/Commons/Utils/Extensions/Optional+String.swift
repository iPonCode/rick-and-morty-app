//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {

	/// Default Value for a nil String
	var dValue: String {
		self ?? "nil"
	}

	/// Empty default Value for a nil String
	var orEmptyIfNil: String {
		self ?? ""
	}
}

