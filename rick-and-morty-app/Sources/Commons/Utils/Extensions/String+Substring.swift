//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

extension String {

	func first(
		_ chars: Int
	) -> String {
		guard chars >= 0 else { return "" }
		return String(self.prefix(chars))
	}

	func last(
		_ chars: Int
	) -> String {
		guard chars >= 0 else { return "" }
		return String(self.suffix(chars))
	}

	func excludingFirst(
		chars: Int
	) -> String {
		guard chars >= 0 else { return "" }
		return String(self.suffix(self.count - chars))
	}

	func excludingLast(
		chars:Int
	) -> String {
		guard chars >= 0 else { return "" }
		return String(self.prefix(self.count - chars))
	}
}

